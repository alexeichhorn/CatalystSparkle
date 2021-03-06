# Catalyst + SwiftUI + Sparkle = ?

Now that we can make Mac applications using Catalyst, the question arises of how to distribute updates if we're not in the App Store. Even if we are in the App Store, we might want to be able to distribute beta versions to testers.

The traditional approach would be to use Sparkle, but that doesn't work out of the box with a Catalyst app, because some of the API that Sparkle relies on is not available.

This project implements a way to get it working.


## The Basic Plan

Create a plugin which your Catalyst app loads.

Have the plugin link with Sparkle and talk to it.

Have the plugin call back to the main app to present the user interface for updates, and pass back user actions to Sparkle.



## How To Use This Project

This repository contains all the bits that you actually need to put into your own app.

1. Link your application with the `SparkleBridgeClient` framework and embed it in your application.
2. Import `SparkleBridgeClient`
3. Subclass `SparkleDriver` and implement the Sparkle UI in whatever way fits your use case.
4. Call `SparkleBridgeClient.load(with: driver)`, passing in an instance of your driver subclass.

See also [CatalystSparkleExample](https://github.com/elegantchaos/CatalystSparkleExample), which contains a full example application.


## The Tricky Details

The basic mechanism for bridging the gap between Catalyst and AppKit is to load a plugin. There's [a great blog post](https://www.highcaffeinecontent.com/blog/20190607-Beyond-the-Checkbox-with-Catalyst-and-AppKit) explaining how this all works, so I won't go over that ground again.

In our case, the plugin links against AppKit and Sparkle, and embeds the Sparkle framework.

The Catalyst-based app embeds the plugin (in its `Resources/` folder). The various Sparkle-related keys go into the App's `Info.plist` file, as normal. Similarly, it is the app embeds various Sparkle XPC helpers (in its `XPCServices` folder). 

Because they are targetting different architectures, the app and Sparkle get built into different locations (`Debug-maccatalyst/` vs `Debug/`, for a `Debug` configuration). As a result, its cleaner to use a script phase to copy over the XPC bits. 

At runtime, the app loads the plugin and creates an instance of its primary class. This is the object that forms the bridge between the two worlds. The app then calls a method on this bridge, and passes over to it another object that it has implemented. Methods on this object get called when Sparkle needs to show some user interface. Some of these methods pass callback blocks to the app - it calls these when it needs to pass back user responses to Sparkle.  


## User Interface Issues 

You might hope that we could just use Sparkle's default user interface, and indeed this does work in principle. 

Unfortunately though, the default sheet that Sparkle shows when an update is found uses the `WebView` class. Loading a window with a `WebView` instance in it, from the AppKit side of the fence, seems to cause a hard crash. This is likely because two different versions of the `WebKit` framework exist - one that thinks its using UIKit, another that thinks its using AppKit, and somehow we're ending up talking to the wrong one.  

There may be a way to get round this, but there is another solution. Version 2.0 of Sparkle (which is aimed at apps that are sandboxed) has a clean mechanism for replacing the default user interface. 

So the alternative solution is to use this mechanism in the plugin, and to forward all user interface requests to the Catalyst application, which can show its own views to tell the user that there's an update, and pass back user responses to the plugin.

Clearly, having to make your own user interface for Sparkle is more work, especially given the amount of effort that has been put into localization of Sparkle already. However, it potentially has some advantages too - for example it allows you to use SwiftUI, or to do a funky update-status-in-the-titlebar implementation.

When it comes to opportunities for re-use, there's no reason in the long run why a UIKit or SwiftUI based Sparkle interface could not be developed and shared (either by the Sparkle project, or as a separate resource by someone else).

## Sandboxing, Codesigning & Sparkle

In general these days you will probably sandboxing on. 

This means that you'll want to use the `2.x` branch of Sparkle.

When you embed Sparkle and the various Sparkle XPC services in your app, you will also need to arrange to sign them properly; especially if you want to notarize the app.

Xcode is usually quite good now at managing the re-signing of embedded things for you. However, as mentioned above, the fact that the Sparkle-related things are built for a different architecture makes it hard to get Xcode to embed them properly, so you may find it easier to do it in a script phase.

Here's a snippet of the sort of code you'll need:

```
# By default, use the configured code signing identity for the project/target
IDENTITY="${EXPANDED_CODE_SIGN_IDENTITY}"
if [ "$IDENTITY" == "" ]
then
    # If a code signing identity is not specified, use ad hoc signing
    IDENTITY="-"
fi


codesign --verbose --force --deep --options runtime --sign "$IDENTITY" "$BUILT_RESOURCES_DIR/AppKitBridge.bundle/Contents/Frameworks/Sparkle.framework/Versions/A/Resources/Updater.app"
codesign --verbose --force --deep --options runtime --sign "$IDENTITY" "$BUILT_RESOURCES_DIR/AppKitBridge.bundle/Contents/Frameworks/Sparkle.framework/Versions/A"
codesign --verbose --force --deep --options runtime --sign "$IDENTITY" "$BUILT_RESOURCES_DIR/SparkleBridge.bundle"

for name in ${XPCS[@]}
do
    echo "Re-signing $name"
    codesign --verbose --force --deep --options runtime --sign "$IDENTITY" "$BUILT_XPCSERVICES_DIR/$name"
done
```

This script expects the various Sparkle products to be signed already, so you may also have to modify your copy of Sparkle slightly to sign everything with your keys. 

There are probably simpler/cleaner ways to handle all of this. One idea might be to have the script build Sparkle using `xcodebuild`, supplying overrides for the code signing settings. That way you can ensure they get built right first time, without having to modify Sparkle.

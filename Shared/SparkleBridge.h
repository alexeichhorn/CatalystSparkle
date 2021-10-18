// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 27/02/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct {
    BOOL automaticUpdateChecks;
    BOOL sendSystemProfile;
} SparkleBridgeUpdatePermissionResponse;

@protocol SparkleBridge <NSObject>
- (void)showCanCheckForUpdates:(BOOL)canCheckForUpdates;
- (void)showUpdatePermissionRequest:(NSArray<NSDictionary<NSString *, NSString *> *> *)request reply:(void (^)(SparkleBridgeUpdatePermissionResponse))reply;
- (void)showUserInitiatedUpdateCheckWithCancellation:(void (^)(void))cancellation;
- (void)dismissUserInitiatedUpdateCheck;
- (void)showUpdateFoundWithAppcastItem:(NSDictionary *)appcastItem userInitiated:(BOOL)userInitiated stage:(NSInteger)stage reply:(void (^)(NSInteger))reply;
- (void)showUpdateReleaseNotesWithDownloadData:(NSData *)downloadData encoding: (nullable NSString *) encoding mimeType: (nullable NSString *) mimeType;
- (void)showUpdateReleaseNotesFailedToDownloadWithError:(NSError *)error;
- (void)showUpdateNotFoundWithError:(NSError *)error acknowledgement:(void (^)(void))acknowledgement;
- (void)showUpdaterError:(NSError *)error acknowledgement:(void (^)(void))acknowledgement;
- (void)showDownloadInitiatedWithCancellation:(void (^)(void))cancellation;
- (void)showDownloadDidReceiveExpectedContentLength:(uint64_t)expectedContentLength;
- (void)showDownloadDidReceiveDataOfLength:(uint64_t)length;
- (void)showDownloadDidStartExtractingUpdate;
- (void)showExtractionReceivedProgress:(double)progress;
- (void)showReadyToInstallAndRelaunch:(void (^)(NSInteger))reply;
- (void)showInstallingUpdate;
- (void)showSendingTerminationSignal;
- (void)showUpdateInstalledAndRelaunched:(BOOL)relaunched acknowledgement:(void (^)(void))acknowledgement;
- (void)showUpdateInFocus;
- (void)dismissUpdateInstallation;
@end

@protocol SparkleBridgePlugin <NSObject>
- (BOOL)setupWithBridge: (id<SparkleBridge>)bridge error:(NSError **)error;
- (void)checkForUpdates;
@end

NS_ASSUME_NONNULL_END

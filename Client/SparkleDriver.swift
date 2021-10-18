// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 26/02/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

/// Class that exists on the Swift/Catalyst side of the bridge, and implements the SparkleBridge protocol.
/// Your application should subclass this, and override some or all of the methods to respond to the
/// messages coming from Sparkle.
///
/// The plugin has to strip away some of the type information in order to pass things over the bridge.
/// To make things a little nicer, this class adds back some Swift versions of the various enums.

open class SparkleDriver: NSObject, SparkleBridge {
    
    /// Swiftified versions of some of the Sparkle types

    public typealias UpdatePermissionRequest = [[String:String]]
    public typealias UpdatePermissionResponse = SparkleBridgeUpdatePermissionResponse
    
    public typealias AppcastItem = [AnyHashable:Any]
    
    public typealias UpdateAlertCallback = (UserUpdateChoice) -> Void
    public typealias UserInitiatedCallback = (UserInitiatedCheckStatus) -> Void
    public typealias UpdateStatusCallback = (UserUpdateChoice) -> Void
    public typealias DownloadStatusCallback = (DownloadUpdateStatus) -> Void
    public typealias InformationCallback = (InformationalUpdateAlertChoice) -> Void
    
    public enum UserInitiatedCheckStatus: UInt {
        case done = 0
        case cancelled = 1
    }

    public enum InstallUpdateStatus: UInt {
        case install
        case installAndRelaunch
        case dismiss
    }
    
    public enum UserUpdateChoice: Int {
        case skip
        case install
        case dismiss
    }
    
    public enum UserUpdateStage: Int {
        case notDownloaded
        case downloaded
        case installing
    }
    
    public struct UserUpdateState {
        public let stage: UserUpdateStage
        public let userInitiated: Bool
    }

    public enum InformationalUpdateAlertChoice: Int {
        case dismiss
        case skip
    }

    public enum DownloadUpdateStatus: UInt {
        case done
        case cancelled
    }

    public enum UpdateAlertChoice: Int {
        case update
        case later
        case skip
    }
    
    /// Implementations of the bridge protocol that call onto more Swift-friendly methods
    /// (subclass should not override these)
    
    /*public final func showUserInitiatedUpdateCheck(cancellation: @escaping () -> Void) {
        showUserInitiatedUpdateCheck() { cancellation() }
    }*/
    
    public final func showUpdateFound(with appcastItem: AppcastItem, userInitiated: Bool, state: UserUpdateState, reply: @escaping (Int) -> Void) {
        showUpdateFound(with: appcastItem, userInitiated: userInitiated, state: state) { respone in reply(respone.rawValue) }
    }
    
    public func showUpdateFound(withAppcastItem appcastItem: AppcastItem, userInitiated: Bool, stage: Int, reply: @escaping (Int) -> Void) {
        showUpdateFound(with: appcastItem, userInitiated: userInitiated, state: UserUpdateState(stage: UserUpdateStage(rawValue: stage)!, userInitiated: userInitiated)) { choice in
            reply(choice.rawValue)
        }
    }
    
    public final func showInformationalUpdateFound(withAppcastItem appcastItem: AppcastItem, userInitiated: Bool, reply: @escaping (Int) -> Void) {
        showInformationalUpdateFound(with: appcastItem, userInitiated: userInitiated) { response in reply(response.rawValue) }
    }
    
    public final func showReady(toInstallAndRelaunch reply: @escaping (Int) -> Void) {
        showReady() { response in reply(response.rawValue) }
    }

    /// Bridge/Swiftified API
    /// (subclasses should override these)
    
    open func showCanCheck(forUpdates canCheckForUpdates: Bool) { }
    open func showUpdatePermissionRequest(_ request: UpdatePermissionRequest, reply: @escaping (UpdatePermissionResponse) -> Void) { }
    open func dismissUserInitiatedUpdateCheck() { }
    open func showUpdateReleaseNotes(withDownloadData downloadData: Data, encoding: String?, mimeType: String?) { }
    open func showUpdateReleaseNotesFailedToDownloadWithError(_ error: Error) { }
    open func showUpdateNotFoundWithError(_ error: Error, acknowledgement: @escaping () -> Void) { }
    open func showUpdaterError(_ error: Error, acknowledgement: @escaping () -> Void) { }
    open func showDownloadDidReceiveExpectedContentLength(_ expectedContentLength: UInt64) { }
    open func showDownloadDidReceiveData(ofLength length: UInt64) { }
    open func showDownloadDidStartExtractingUpdate() { }
    open func showExtractionReceivedProgress(_ progress: Double) { }
    open func showInstallingUpdate() { }
    open func showSendingTerminationSignal() { }
    open func showUpdateInstalledAndRelaunched(_ relaunched: Bool, acknowledgement: @escaping () -> Void) { }
    open func dismissUpdateInstallation() { }
    open func showUpdateInFocus() { }
    open func showUserInitiatedUpdateCheck(cancellation: @escaping () -> Void) { }
    open func showUpdateFound(with appcastItem: AppcastItem, userInitiated: Bool, state: UserUpdateState, reply: @escaping UpdateAlertCallback) { }
    open func showInformationalUpdateFound(with appcastItem: AppcastItem, userInitiated: Bool, reply: @escaping InformationCallback) { }
    open func showDownloadInitiated(cancellation: @escaping () -> Void) { }
    open func showReady(toInstallAndRelaunch reply: @escaping UpdateStatusCallback) { }
}

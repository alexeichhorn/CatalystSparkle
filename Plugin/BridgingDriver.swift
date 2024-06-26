// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 27/02/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import Sparkle

/// Sparkle Driver which forwards all messages on to a bridge object.
///
/// The bridge straddles the Obj-C/Swift barrier, and implements an
/// Objective-C protocol, so it doesn't:
/// - use native Swift types
/// - expose Sparkle types
///
/// As a result, it has to do some minor conversion of data in both
/// directions. In theory it also sacrifices a bit of type safety,
/// although in this example it is added back on the other side
/// of the fence.

internal class BridgingDriver: NSObject, SPUUserDriver {
    
    let driver: SparkleBridge

    init(wrapping driver: SparkleBridge) {
        self.driver = driver
    }
    
    func showCanCheck(forUpdates canCheckForUpdates: Bool) {
        driver.showCanCheck(forUpdates: canCheckForUpdates)
    }
    
    func show(_ request: SPUUpdatePermissionRequest, reply: @escaping (SUUpdatePermissionResponse) -> Void) {
        driver.showUpdatePermissionRequest(request.systemProfile) { response in
            reply(SUUpdatePermissionResponse(response))
        }
    }
    
    func showUserInitiatedUpdateCheck(cancellation: @escaping () -> Void) {
        driver.showUserInitiatedUpdateCheck {
            cancellation()
        }
    }
    
    func dismissUserInitiatedUpdateCheck() {
        driver.dismissUserInitiatedUpdateCheck()
    }
    
    func showUpdateFound(with appcastItem: SUAppcastItem, state: SPUUserUpdateState, reply: @escaping (SPUUserUpdateChoice) -> Void) {
        driver.showUpdateFound(withAppcastItem: appcastItem.propertiesDictionary, userInitiated: state.userInitiated, stage: state.stage.rawValue) { choice in
            reply(SPUUserUpdateChoice(rawValue: choice)!)
        }
    }
    
    func showUpdateReleaseNotes(with downloadData: SPUDownloadData) {
        driver.showUpdateReleaseNotes(withDownloadData: downloadData.data, encoding: downloadData.textEncodingName, mimeType: downloadData.mimeType)
    }
    
    func showUpdateReleaseNotesFailedToDownloadWithError(_ error: Error) {
        driver.showUpdateReleaseNotesFailedToDownloadWithError(error)
    }
    
    func showUpdateNotFoundWithError(_ error: Error, acknowledgement: @escaping () -> Void) {
        driver.showUpdateNotFoundWithError(error) {
            acknowledgement()
        }
    }
    
    func showUpdaterError(_ error: Error, acknowledgement: @escaping () -> Void) {
        driver.showUpdaterError(error) {
            acknowledgement()
        }
    }
    
    func showDownloadInitiated(cancellation: @escaping () -> Void) {
        driver.showDownloadInitiated {
            cancellation()
        }
    }
    
    func showDownloadDidReceiveExpectedContentLength(_ expectedContentLength: UInt64) {
        driver.showDownloadDidReceiveExpectedContentLength(expectedContentLength)
    }
    
    func showDownloadDidReceiveData(ofLength length: UInt64) {
        driver.showDownloadDidReceiveData(ofLength: length)
    }
    
    func showDownloadDidStartExtractingUpdate() {
        driver.showDownloadDidStartExtractingUpdate()
    }
    
    func showExtractionReceivedProgress(_ progress: Double) {
        driver.showExtractionReceivedProgress(progress)
    }
    
    func showReady(toInstallAndRelaunch reply: @escaping (SPUUserUpdateChoice) -> Void) {
        driver.showReady() { status in
            reply(SPUUserUpdateChoice(rawValue: status)!)
        }
    }
    
    
    func showInstallingUpdate() {
        driver.showInstallingUpdate()
    }
    
    func showSendingTerminationSignal() {
        driver.showSendingTerminationSignal()
    }
    
    func showUpdateInstalledAndRelaunched(_ relaunched: Bool, acknowledgement: @escaping () -> Void) {
        driver.showUpdateInstalledAndRelaunched(relaunched) { acknowledgement() }
    }
    
    func showUpdateInFocus() {
        driver.showUpdateInFocus()
    }
    
    func dismissUpdateInstallation() {
        driver.dismissUpdateInstallation()
    }
}

extension SUUpdatePermissionResponse {
    convenience init(_ bridged: SparkleBridgeUpdatePermissionResponse) {
        self.init(automaticUpdateChecks: bridged.automaticUpdateChecks.boolValue, sendSystemProfile: bridged.sendSystemProfile.boolValue)
    }
}


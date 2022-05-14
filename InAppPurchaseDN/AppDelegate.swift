//
//  AppDelegate.swift
//  InAppPurchaseDN
//
//  Created by Dat Nguyen on 20/01/2022.
//

import UIKit
import PushKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, PKPushRegistryDelegate {
    
    var voipRegistry: PKPushRegistry?
    
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        let deviceTokenString = pushCredentials.token.map { String(format: "%02.2hhx", $0) }.joined()
                   NSLog("deviceTokenString \(deviceTokenString)")

    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        NSLog("%@", payload)
    }
    
//    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType) async {
//        NSLog("%@", payload)
//
//    }



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        registerForVoIPPushes()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func registerForVoIPPushes() {
        let mainQueue = DispatchQueue.main
        self.voipRegistry = PKPushRegistry.init(queue: mainQueue)
        self.voipRegistry?.delegate = self
        self.voipRegistry?.desiredPushTypes = [.voIP]
    }


    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


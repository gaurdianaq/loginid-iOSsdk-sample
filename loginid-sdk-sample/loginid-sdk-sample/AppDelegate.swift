//
//  AppDelegate.swift
//  loginid-sdk-sample
//
//  Created by Evan Tatay-Hinds on 2020-06-09.
//  Copyright © 2020 hatchways. All rights reserved.
//

import UIKit
import LoginSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let clientId = "xuaH-iewaahcSKnz666GMGzuGN3YwA3uBcZqFlX5YvsaqBnez_uWGlbMJ-4ja69wHd9w-8RNNg5lOXTKKH_4NA=="
        let baseURL = "https://d1d896a0-ab4f-11ea-9a24-1b6b66ffeea6.sandbox.native-api.auth.asliri.id"
        LoginAPI.client.configure(clientId: clientId, baseURL: baseURL)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


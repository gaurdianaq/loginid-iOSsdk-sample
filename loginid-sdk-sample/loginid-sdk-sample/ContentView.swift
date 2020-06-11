//
//  ContentView.swift
//  loginid-sdk-sample
//
//  Created by Shamila Corless on 2020-06-11.
//  Copyright © 2020 hatchways. All rights reserved.
//

import SwiftUI
import LoginSDK

struct ContentView: View {
    @State var isLoggedIn = LoginAPI.client.isLoggedIn()
    @State var hasAccount = LoginAPI.client.hasAccount()
    @State var outputMsg = ""
    var body: some View {
        VStack {
            if isLoggedIn {
                AuthenticatedView(isLoggedIn: $isLoggedIn)
            }
            else {
                UnauthenticatedView(isLoggedIn: $isLoggedIn, hasAccount: $hasAccount, outputMsg: $outputMsg)
            }
            Spacer()
            if hasAccount {
                Button(action: {
                    LoginAPI.client.deleteAccount()
                    self.hasAccount = LoginAPI.client.hasAccount()
                }) {
                    Text("Delete Account")
                }
            }
            Spacer()
            Text(self.outputMsg)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

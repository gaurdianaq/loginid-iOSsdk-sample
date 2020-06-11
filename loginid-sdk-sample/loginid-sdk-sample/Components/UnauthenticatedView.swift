//
//  UnauthenticatedView.swift
//  loginid-sdk-sample
//
//  Created by Shamila Corless on 2020-06-11.
//  Copyright © 2020 hatchways. All rights reserved.
//

import SwiftUI
import LoginSDK

struct UnauthenticatedView: View {
    @State var userName: String = ""
    
    @Binding var isLoggedIn: Bool
    @Binding var hasAccount: Bool
    @Binding var outputMsg: String
    
    public init(isLoggedIn: Binding<Bool>, hasAccount: Binding<Bool>, outputMsg: Binding<String>) {
        self._isLoggedIn = isLoggedIn
        self._hasAccount = hasAccount
        self._outputMsg = outputMsg
    }
    
    var body: some View {
        VStack {
            Spacer()
            if (self.hasAccount) {
                Text("Please login!")
                Spacer()
                Button(action: {
                    LoginAPI.client.login(onComplete: { (response) in
                        if (response.success) {
                            self.outputMsg = "Successfully logged in!"
                            self.isLoggedIn = LoginAPI.client.isLoggedIn()
                        }
                        else {
                            self.outputMsg = response.errorMessage
                        }
                    })
                }) {
                    Text("Login")
                }
            }
            else {
                Text("You need to register an account, please enter a username and click register!")
                Spacer()
                TextField("Username", text: $userName).accessibility(hint: Text("Username"))
                Spacer()
                Button(action: {
                    LoginAPI.client.register(username: self.userName, onComplete: { (response) in
                        if (response.success) {
                            self.outputMsg = "Successfully registered!"
                            self.isLoggedIn = LoginAPI.client.isLoggedIn()
                            self.hasAccount = LoginAPI.client.hasAccount()
                        }
                        else {
                            self.outputMsg = response.errorMessage
                        }
                    })
                }) {
                    Text("Register")
                }
            }
        }
        
    }
}

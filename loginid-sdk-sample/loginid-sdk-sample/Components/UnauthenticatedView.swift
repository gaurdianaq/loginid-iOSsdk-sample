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
                Button(action: {
                    LoginAPI.client.login(onComplete: { (response) in
                        if (response.success) {
                            self.outputMsg = "Successfully logged in!"
                        }
                        else {
                            self.outputMsg = response.errorMessage
                        }
                        self.isLoggedIn = LoginAPI.client.isLoggedIn()
                    })
                }) {
                    Text("Login")
                }
            }
            else {
                TextField("Username", text: $userName).accessibility(hint: Text("Username"))
                Spacer()
                Button(action: {
                    LoginAPI.client.register(username: self.userName, onComplete: { (response) in
                        if (response.success) {
                            self.outputMsg = "Successfully registered!"
                        }
                        else {
                            self.outputMsg = response.errorMessage
                        }
                        self.isLoggedIn = LoginAPI.client.isLoggedIn()
                    })
                }) {
                    Text("Register")
                }
            }
        }
        
    }
}

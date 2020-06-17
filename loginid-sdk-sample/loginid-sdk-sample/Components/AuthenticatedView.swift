//
//  AuthenticatedView.swift
//  loginid-sdk-sample
//
//  Created by Shamila Corless on 2020-06-11.
//  Copyright © 2020 hatchways. All rights reserved.
//

import SwiftUI
import LoginSDK

struct AuthenticatedView: View {
    @Binding var isLoggedIn: Bool
    @Binding var outputMsg: String
    var welcomeMessage: String
    
    init(isLoggedIn: Binding<Bool>, outputMsg: Binding<String>) {
        self._isLoggedIn = isLoggedIn
        self._outputMsg = outputMsg
        if LoginAPI.client.getCurrentUsername() != nil {
            welcomeMessage = "Welcome " + LoginAPI.client.getCurrentUsername()!
        }
        else {
            welcomeMessage = "I'd welcome you but you don't seem to have a name!"
        }
    }
    
    
    var body: some View {
        VStack {
            Text(welcomeMessage)
            Image("gawain").resizable().scaledToFit().clipShape(Circle())
            Button(action: {
                LoginAPI.client.logout()
                self.isLoggedIn = LoginAPI.client.isLoggedIn()
            }) {
                Text("Logout")
            }
        }
        
    }
}

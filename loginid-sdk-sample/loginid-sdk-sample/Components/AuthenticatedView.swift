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
    
    var body: some View {
        VStack {
            Text("Authenticated")
            Button(action: {
                LoginAPI.client.logout()
                self.isLoggedIn = LoginAPI.client.isLoggedIn()
            }) {
                Text("Logout")
            }
        }
        
    }
}

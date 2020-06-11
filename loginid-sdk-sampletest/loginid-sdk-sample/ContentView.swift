//
//  ContentView.swift
//  loginid-sdk-sample
//
//  Created by Evan Tatay-Hinds on 2020-06-09.
//  Copyright © 2020 hatchways. All rights reserved.
//

import SwiftUI
import LoginSDK

struct ContentView: View {
    
    @State var outputMsg = "Output data goes here!"
    @State var input = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $input).accessibility(hint: Text("Username"))
            Spacer()
            HStack {
                VStack {
                    Button(action: {
                        LoginAPI.client.register(onComplete: { (response) in
                            if (response.success) {
                                self.outputMsg = "Successfully registered!"
                            }
                            else {
                                self.outputMsg = response.errorMessage
                            }
                        })
                    }) {
                        Text("Register")
                    }.padding(.vertical, 10)
                    Button(action: {
                        LoginAPI.client.login(onComplete: { (response) in
                            if (response.success) {
                                self.outputMsg = "Successfully logged in!"
                            }
                            else {
                                self.outputMsg = response.errorMessage
                            }
                        })
                    }) {
                        Text("Login")
                    }.padding(.vertical, 10)
                    Button(action: {
                        self.outputMsg = String(LoginAPI.client.hasAccount())
                    }) {
                        Text("Has Account?")
                    }.padding(.vertical, 10)
                    Button(action: {
                        self.outputMsg = LoginAPI.client.getCurrentUsername() ?? "No username found!"
                    }) {
                        Text("Get Username")
                    }.padding(.vertical, 10)
                    Button(action: {
                        LoginAPI.client.logout()
                    }) {
                        Text("Logout")
                    }.padding(.vertical, 10)
                }
                VStack {
                    Button(action: {
                        LoginAPI.client.register(username: self.input, onComplete: { (response) in
                            if (response.success) {
                                self.outputMsg = "Successfully registered " + self.input + "!"
                            }
                            else {
                                self.outputMsg = response.errorMessage
                            }
                        })
                    }) {
                        Text("Register with Username")
                    }.padding(.vertical, 10)
                    /*
                    Button(action: {
                        
                    }) {
                        Text("Login with Username")
                    }.padding(.vertical, 10)*/
                    Button(action: {
                        self.outputMsg = String(LoginAPI.client.isLoggedIn())
                    }) {
                        Text("Is Logged In?")
                    }.padding(.vertical, 10)
                    Button(action: {
                        self.outputMsg = LoginAPI.client.getCurrentAccessToken() ?? "No access token found!"
                    }) {
                        Text("Get JWT Token")
                    }.padding(.vertical, 10)
                    Button(action: {
                        LoginAPI.client.deleteAccount()
                    }) {
                        Text("Delete Account")
                    }.padding(.vertical, 10)
                }
            }.buttonStyle(MyButtonStyle())
            Spacer()
            Text(outputMsg)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

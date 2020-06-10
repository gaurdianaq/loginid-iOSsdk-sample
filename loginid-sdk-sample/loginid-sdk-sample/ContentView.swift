//
//  ContentView.swift
//  loginid-sdk-sample
//
//  Created by Shamila Corless on 2020-06-09.
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
                        self.outputMsg = self.input
                    }) {
                        Text("Register")
                    }.padding(.vertical, 10)
                    Button(action: {
                    }) {
                        Text("Login")
                    }.padding(.vertical, 10)
                    Button(action: {
                    }) {
                        Text("Has Account?")
                    }.padding(.vertical, 10)
                    Button(action: {
                    }) {
                        Text("Get Username")
                    }.padding(.vertical, 10)
                    Button(action: {
                    }) {
                        Text("Logout")
                    }.padding(.vertical, 10)
                }
                VStack {
                    Button(action: {
                    
                    }) {
                        Text("Register with Username")
                    }.padding(.vertical, 10)
                    Button(action: {
                    }) {
                        Text("Login with Username")
                    }.padding(.vertical, 10)
                    Button(action: {
                    }) {
                        Text("Is Logged In?")
                    }.padding(.vertical, 10)
                    Button(action: {
                    }) {
                        Text("Get JWT Token")
                    }.padding(.vertical, 10)
                    Button(action: {
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

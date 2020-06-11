//
//  MyButtonStyle.swift
//  loginid-sdk-sample
//
//  Created by Evan Tatay-Hinds on 2020-06-10.
//  Copyright © 2020 hatchways. All rights reserved.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color(red: 0.7, green: 0.7, blue: 0.7))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

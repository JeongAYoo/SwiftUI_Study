//
//  ContentView.swift
//  SwiftUI_Study
//
//  Created by Jade Yoo on 2023/05/10.
//

import SwiftUI

enum Field {
    case email
    case password
}

struct ContentView: View {
    @FocusState private var focusField: Field?
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                // welcome text
                Text("Welcome back.")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.bottom, 30)
                
                // email text, textfield
                Text("Email address")
                    .fontWeight(.semibold)
                TextField("Email address", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusField, equals: .email)
                    .padding(.bottom, 20)
                
                // pw text, textfield
                Text("Password")
                    .fontWeight(.semibold)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusField, equals: .password)
                    .padding(.bottom, 20)
                
                // find pw button
                Button("Forgot password?") {
                    if email.isEmpty {
                        focusField = .email
                    } else if password.isEmpty {
                        focusField = .password
                    } else {
                        print("Complete Email & Password Input")
                    }
                }
                .foregroundColor(.purple)
                .bold()
            }
            .padding(.top, 40)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            VStack(alignment: .center, spacing: 20) {
                Button {
                    
                } label: {
                    Text("Log in")
                        .frame(maxWidth: .infinity, minHeight: 45)
                        .bold()
                }
                .foregroundColor(.white)
                .tint(.black)
                .buttonStyle(.borderedProminent)
                .cornerRadius(30)
                Button {
                    
                } label: {
                    Text("Sign up").frame(maxWidth: .infinity, minHeight: 44)
                        .bold()
                }
                .foregroundColor(.black)
                .tint(.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(.black, lineWidth: 2)
                    .frame(minHeight: 54))
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

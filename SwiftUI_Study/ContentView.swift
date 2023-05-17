//
//  ProfileView.swift
//  SwiftUI_Study
//
//  Created by Jade Yoo on 2023/05/10.
//

import SwiftUI

enum Field {
    case email
    case password
}

struct ProfileView: View {
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
                    .font(.headline)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(.gray.opacity(0.4), lineWidth: 2).frame(height: 50))
                    .focused($focusField, equals: .email)
                    .padding(.bottom, 15)
                
                // pw text, textfield
                Text("Password")
                    .fontWeight(.semibold)
                SecureField("Password", text: $password)
                    .font(.headline)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(.gray.opacity(0.4), lineWidth: 2).frame(height: 50))
                    .focused($focusField, equals: .password)
                    .padding(.bottom, 10)
                
                // find pw button
                Button("Forgot password?") { }
                    .foregroundColor(.blue)
                    .bold()
            }
            .padding(.top, 40)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 20)
            
            VStack(alignment: .center, spacing: 20) {
                Button {
                    if email.isEmpty {
                        focusField = .email
                    } else if password.isEmpty {
                        focusField = .password
                    } else {
                        print("Complete Email & Password Input")
                    }
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

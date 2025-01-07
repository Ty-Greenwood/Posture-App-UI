//
//  LoginView.swift
//  AlignPro
//
//  Created by Jim Greenwood on 2025-01-02.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Binding var correctEmail: String
    @Binding var correctPassword: String
    
    @State var enteredEmail: String = ""
    @State var enteredPassword: String = ""
    @State var wrongEmail: Bool = false
    @State var wrongPassword: Bool = false
    
    var body: some View {
        
        
        Text("Log In")
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.all)
        
        TextField("Email Address", text: $enteredEmail)
            .autocorrectionDisabled()
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            .textContentType(.emailAddress)
            .textFieldStyle(.roundedBorder)
            .foregroundStyle(Color("Text Colour"))
            .padding([.leading, .bottom, .trailing])
        
        SecureField("Password", text: $enteredPassword)
            .autocorrectionDisabled()
            .textContentType(.emailAddress)
            .textFieldStyle(.roundedBorder)
            .foregroundStyle(Color("Text Colour"))
            .padding([.leading, .bottom, .trailing])
        
        if(wrongEmail){
            Text("No account with that email!")
                .foregroundStyle(Color.red)
                .padding([.leading, .bottom, .trailing])
        }
        if(wrongPassword){
            Text("Password is incorrect!")
                .foregroundStyle(Color.red)
                .padding([.leading, .bottom, .trailing])
        }
        
        Button("Log In"){
            if(enteredEmail != correctEmail){
                wrongEmail = true
            }
            else{
                wrongEmail = false
            }
            if(enteredPassword != correctPassword){
                wrongPassword = true
            }
            else{
                wrongPassword = false
            }
            if(!wrongEmail && !wrongPassword){
                isLoggedIn = true
            }
        }
        .padding(.all)
        .foregroundStyle(Color("Button Text Colour"))
        .fontWeight(.semibold)
        .background(Color("AccentColor"))
        .clipShape(Capsule())
        
        Spacer()
    }
}

#Preview {
    ContentView()
}

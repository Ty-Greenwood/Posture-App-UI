//
//  ContentView.swift
//  Test App
//
//  Created by Ty Greenwood on 2024-12-29.
//

import SwiftUI

struct ContentView: View {
    @State var isLoggedIn: Bool = false
    @State var correctEmail: String = "tygreenwood02@gmail.com"
    @State var correctPassword: String = "LimpChiken"
    
    var body: some View {
        ZStack{
            Color("Background Colour")
                .ignoresSafeArea()
            
            VStack{
                ZStack{
                    Color("AccentColor")
                        .ignoresSafeArea()
                        .frame(height: 80)
                    
                    Image("AppTitle")
                }
                
                if(!isLoggedIn){
                    LoginView(isLoggedIn: $isLoggedIn, correctEmail: $correctEmail, correctPassword: $correctPassword)
                }
                else{
                    TabView{
                        HistoryView()
                            .tabItem{
                                Image(systemName: "chart.line.uptrend.xyaxis")
                            }
                        DevicesView()
                            .tabItem{
                                Image(systemName: "app.connected.to.app.below.fill")
                            }
                        FAQView()
                            .tabItem{
                                Image(systemName: "questionmark.app")
                            }
                        SettingsView(isLoggedIn: $isLoggedIn, correctEmail: $correctEmail, correctPassword: $correctPassword)
                            .tabItem{
                                Image(systemName: "gear")
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}

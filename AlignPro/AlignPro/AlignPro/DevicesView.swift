//
//  DevicesView.swift
//  AlignPro
//
//  Created by Ty Greenwood on 2024-12-30.
//

import SwiftUI

struct DevicesView: View {
    @State var deviceList = ["Chiken Align",
                             "Carson's AlignPro",
                             "AlignPro of Tejas",
                             "AlignPro Ahmed",
                             "AlignPro 2002",
                             "AP 1976",
                             "AP 00",
                             "AP 01"]
    var body: some View {
        NavigationStack{
            ZStack{
                Color("Background Colour")
                    .ignoresSafeArea()
                
                VStack{
                    Text("My Devices")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text Colour"))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.all)
                    
                    ScrollView{
                        ForEach(deviceList, id: \.self){ device in
                            if device == deviceList[0]{
                                Text(device)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("Text Colour"))
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding([.top, .leading, .trailing])
                            }
                            
                            Text(device)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("Text Colour"))
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.horizontal)
                        }
                    }
                    .border(Color("Text Colour"))
                    .background(Color("Submenu Colour"))
                    .frame(height: 350)
                    .padding(.all)
                    
                    NavigationLink(destination: NewDeviceView()){
                        Text("Connect New Device")
                    }
                    .padding(.all)
                    .foregroundStyle(Color("Button Text Colour"))
                    .fontWeight(.semibold)
                    .background(Color("AccentColor"))
                    .clipShape(Capsule())
                    
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    DevicesView()
}

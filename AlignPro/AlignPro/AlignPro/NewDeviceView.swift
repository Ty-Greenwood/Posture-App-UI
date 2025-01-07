//
//  NewDeviceView.swift
//  AlignPro
//
//  Created by Jim Greenwood on 2024-12-30.
//

import SwiftUI

struct NewDeviceView: View {
    @State var deviceList = ["Available AP 1", "Available AP 2", "New AP 1"]
    var body: some View {
        ZStack{
            Color("Background Colour")
                .ignoresSafeArea()
            
            VStack{
                Text("Connect New Device")
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
                
                Text("Make sure your device is turned on, in paring mode, and in range")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color("Text Colour"))
                    .multilineTextAlignment(.leading)
                    .padding(.all)
                
                Spacer()
            }
        }
    }
}

#Preview {
    NewDeviceView()
}

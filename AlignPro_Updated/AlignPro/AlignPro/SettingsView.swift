import SwiftUI

struct SettingsView: View {
    @Binding var isLoggedIn: Bool
    @State var showAdvanced: Bool = false
    @AppStorage("postureThreshold") private var postureThreshold: Int = 40
    @AppStorage("notificationsEnabled") private var notificationsEnabled: Bool = true // ✅ Toggle notifications

    var body: some View {
        NavigationView {
            ZStack {
                Color("Background Colour")
                    .ignoresSafeArea()

                VStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text Colour"))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.all)

                    // ✅ Toggle Push Notifications
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Enable Push Notifications")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("Text Colour"))
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color("AccentColor")))
                    .padding([.leading, .bottom, .trailing])

                    // ✅ Adjust Posture Sensitivity
                    // Advanced sensitivity controls
                    if showAdvanced{
                        VStack(alignment: .leading){
                            Text("Posture Alert Sensitivity")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("Text Colour"))
                            
                            TextField("Number from 10 - 90", value: $postureThreshold, format: .number)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                                //.padding([.leading, .bottom, .trailing])
                            
                            Text("Enter a number from 10 - 90")
                                .foregroundStyle(Color("Text Colour"))
                        }
                        .padding()
                            
                        Button("Hide Advanced Sensitivity Field") {
                            showAdvanced = false
                        }
                        .padding(.all)
                        .foregroundStyle(Color("Button Text Colour"))
                        .fontWeight(.semibold)
                        .background(Color("AccentColor"))
                        .clipShape(Capsule())
                        
                    }
                    // Basic sensitivity controls
                    else{
                        VStack(alignment: .leading){
                            Text("Posture Alert Sensitivity")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("Text Colour"))
                            
                            Stepper("Threshold: \(postureThreshold)%", value: $postureThreshold, in: 10...90, step: 10)
                                .padding(.horizontal)
                                .onChange(of: postureThreshold) { newValue in
                                    print("⚙️ New posture threshold set: \(newValue)%")
                                }
                        }
                        .padding()
                        
                        Button("Show Advanced Sensitivity Field") {
                            showAdvanced = true
                        }
                        .padding(.all)
                        .foregroundStyle(Color("Button Text Colour"))
                        .fontWeight(.semibold)
                        .background(Color("AccentColor"))
                        .clipShape(Capsule())
                    }

                    Spacer()

                    Button("Log Out") {
                        KeychainHelper.shared.delete(forKey: "authToken")
                        isLoggedIn = false
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

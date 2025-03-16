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
                            
                            // Actual input
                            Stepper("Threshold: \(postureThreshold)%", value: $postureThreshold, in: 10...90, step: 5)
                                .padding(.horizontal)
                                .onChange(of: postureThreshold) { newValue in
                                    print("⚙️ New posture threshold set: \(newValue)%")
                                }
                        }
                        .frame(alignment: .leading)
                        .padding()
                        
                        Text("The posture sensitivity percentage is the accepted deviation from good posture, so lower percentages correspond with higher sensitivities.")
                            .foregroundStyle(Color("Text Colour"))
                            .padding([.bottom, .horizontal])
                        
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
                        VStack(){
                            Text("Posture Alert Sensitivity")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("Text Colour"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                //.padding(.bottom)
                            
                            // Actual input
                            Menu {
                                Button("High - 15%"){
                                    postureThreshold = 15
                                    print("⚙️ New posture threshold set: \(postureThreshold)%")
                                }
                                Button("Medium - 30%"){
                                    postureThreshold = 30
                                    print("⚙️ New posture threshold set: \(postureThreshold)%")
                                }
                                Button("Low - 45%"){
                                    postureThreshold = 45
                                    print("⚙️ New posture threshold set: \(postureThreshold)%")
                                }
                            } label: {
                                Text("Sensitivity Select")
                                    .foregroundStyle(Color("Button Text Colour"))
                                    .fontWeight(.semibold)
                                    .padding()
                                    .background(Color("AccentColor"))
                                    .clipShape(Capsule())
                                    //.frame(alignment: .center)
                            }
                        }
                        //.frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        Text("The posture sensitivity percentage is the accepted deviation from good posture, so lower percentages correspond with higher sensitivities.")
                            .foregroundStyle(Color("Text Colour"))
                            .padding([.bottom, .horizontal])
                        
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

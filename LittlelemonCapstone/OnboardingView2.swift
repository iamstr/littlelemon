//
//  OnboardingView2.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 05/05/2024.
//

import SwiftUI

struct OnboardingView2: View {
    @State private var phone: String = ""
    
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var isLoggedIn = false
   
    
    var body: some View {
        
           
            
            NavigationView{
               
                VStack{
                    Image("Logo")
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Little Lemon")
                                .foregroundColor(Color(hex:"#F4CE14"))
                                .font(.largeTitle)
                                .padding(.leading)
                                .padding(.top,1)
                            
                            Text("Chicago")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding(.leading)
                            
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .foregroundColor(.white)
                                .font(.subheadline).frame(maxWidth:.infinity)
                                .padding([ .bottom])
                            
                        }.padding(.horizontal)
                        Spacer()
                        Image("Hero image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 120, maxHeight: 140)
                            .clipShape(Rectangle())
                            .cornerRadius(16)
                    }.padding(.bottom,10).padding(.top,10).background(Color.primaryColor1)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Phone Number")
                            .padding(.leading,20)
                            .padding(.top,13)
                            .padding(.bottom,-10)
                            .foregroundColor(.gray)
                        
                        TextField(
                            "Phone Number",
                            text: $phone
                        )
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .textFieldStyle(MyTextFieldStyle())
                    }
                   
                    

                   
                    VStack(alignment: .leading) {
                        Text("Email Address")
                            .padding(.leading,20)
                            .padding(.top,1)
                            .padding(.bottom,-10)
                            .foregroundColor(.gray)
                        TextField(
                            "Email",
                            text: $email
                        ).textFieldStyle(MyTextFieldStyle())

                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    }

                   
                    NavigationLink(destination: OnboardingView().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("Go Back")
                                .foregroundColor(.primaryColor1)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                            Spacer()
                        }
                       

                    }
                    
                    
                    if !phone.isEmpty  && !email.isEmpty {
                        
                        
                    }
                    
                    NavigationLink(destination: NotificationView(), isActive: $isLoggedIn) {
                        // Button to register user
                        Button("Email Notifications") {
                            if !phone.isEmpty && !email.isEmpty {
                                // Store user data in UserDefaults
                                UserDefaults.standard.set(phone, forKey: kPhone)
                                UserDefaults.standard.set(email, forKey: kEmail)
                                isLoggedIn = true
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryColor1, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .foregroundColor(.white)
                        .padding([.leading, .bottom, .trailing])
                    }

                    Spacer()
                    
                }

            }
            
            .navigationBarBackButtonHidden(true)
        
    
        
}
}




#Preview {
    OnboardingView2()
}

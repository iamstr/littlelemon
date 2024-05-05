//
//  OnboardingView.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 27/04/2024.
//

import SwiftUI

let kFirstName = "first_name_key"
let kLastName = "last_name_key"
let kEmail = "email_key"
let kIsLoggedIn = "kIsLoggedIn"
let kPhone = "phone_key"
let kOrderStatuses =  "order_statuses_key"
let kPasswordChanges =  "password_changes_key"
let kSpecialOffers =  "special_offers_key"
let kNewsLetter =  "news_letter_key"




struct OnboardingView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var isLoggedIn = false
   
    
    var body: some View {
        NavigationStack{
            
            
                
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
                    }.padding(.bottom,10).padding(.top,10)
                        .background(Color.primaryColor1)
                    
                    VStack(alignment: .leading) {
                        Text("First Name")
                            .padding(.leading,20)
                            .padding(.top,13)
                            .padding(.bottom,-10)
                            .foregroundColor(.gray)
                        
                        TextField(
                            "First name ",
                            text: $firstName
                        )
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .textFieldStyle(MyTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Last Name").padding(.leading,20)
                            .padding(.top,1)
                            .padding(.bottom,-10)
                            .foregroundColor(.gray)
                        TextField(
                            "Last Name",
                            text: $lastName
                        ).textFieldStyle(MyTextFieldStyle())
                        
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                    }
                    
                    
                    
                    
                    
                        // Button to register user
                        Button("Register") {
                            if !firstName.isEmpty && !lastName.isEmpty {
                                // Store user data in UserDefaults
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                                UserDefaults.standard.set(lastName, forKey: kLastName)
                                isLoggedIn = true
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryColor1, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .foregroundColor(.white)
                        .padding([.leading, .bottom, .trailing])
                        .navigationDestination(isPresented: $isLoggedIn){
                            OnboardingView2()
                        }
                    
                    Spacer()
                    
                    
                }
                
            }
            
            
        }


        
        
}





#Preview {
    OnboardingView()
}


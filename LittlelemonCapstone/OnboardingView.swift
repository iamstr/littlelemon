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

struct OnboardingView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var isLoggedIn = false
   
    
    var body: some View {
        NavigationStack {
            
            
            NavigationView{
                VStack{
                    TextField(
                        "First name ",
                        text: $firstName
                    )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
        
                    TextField(
                        "Last Name",
                        text: $lastName
                    )

                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)

                    TextField(
                        "Email",
                        text: $email
                    )

                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    
                    
                    // Button to register user
                    Button("Register") {
                        
                        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            // Store user data in UserDefaults
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                          
                            isLoggedIn = true
                        }
                    } .navigationDestination(isPresented: $isLoggedIn){
                        
                        
                        HomeView()
                    }
                    
                }
                onAppear{
                    print(UserDefaults.standard.bool(forKey: kIsLoggedIn))
                    if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                                       isLoggedIn = true
                                   }
                }
            }
        
    }
        
}
}




#Preview {
    OnboardingView()
}


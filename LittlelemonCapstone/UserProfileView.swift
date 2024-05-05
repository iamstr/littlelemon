//
//  UserProfileView.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 28/04/2024.
//

import SwiftUI

struct UserProfileView: View {
//    let defaults = UserDefaults.standard
    let kFirstName = "first_name_key"
    let kLastName = "last_name_key"
    let kEmail = "email_key"
    let kPhone = "phone_key"
    let kIsLoggedIn = "kIsLoggedIn"
    let kOrderStatuses =  "order_statuses_key"
    let kPasswordChanges =  "password_changes_key"
    let kSpecialOffers =  "special_offers_key"
    let kNewsLetter =  "news_letter_key"
    @Environment(\.presentationMode) var presentation
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var orderStatuses = false
    @State private var passwordChanges = false
    @State private var specialOffers = false
    @State private var newsLetter = false
    @State private var isLoggedOut = false
    

    var body: some View {
        NavigationView{
            
            
                VStack(alignment:.leading){
                    
                    HStack {
                        
                       
                        Button(action:{
                            self.presentation.wrappedValue.dismiss()
                            
                        }){
                            
                            Image(systemName: "arrowshape.left.circle.fill")
                                .font(.system(size: 26))
                                .padding(.leading)
                                .foregroundColor(.primaryColor1)

                        }
                 
                        Spacer()
                            Image("Logo")  .padding([.trailing,.leading])
                            Spacer()
                            
                            Image("profile-image-placeholder")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                            
                                .clipShape(Circle())
                                .frame(maxHeight: 50)
                                .padding([.trailing])
                            

                    }
                    ScrollView{
                   
                    HStack {
                        Text("Personal information")
                            .font(.title2)
                            .multilineTextAlignment(.leading)
   
                            .fontWeight(.bold)
                            .padding(.leading,18)
                            
                        Spacer()
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("First Name")
                            .padding(.leading,20)
                            .padding(.top,1)
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

                   
                    VStack(alignment: .leading) {
                        Text("Email")
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
                        
                        
                        VStack(alignment: .leading) {
                            Text("Phone")
                                .padding(.leading,20)
                                .padding(.top,1)
                                .padding(.bottom,-10)
                                .foregroundColor(.gray)
                            TextField(
                                "Phone",
                                text: $phone
                            ).textFieldStyle(MyTextFieldStyle())

                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                        }
                    
                    HStack {
                        Text("Email notifications")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
    //                        .frame(maxWidth: .infinity)
                            .fontWeight(.bold)
                            .padding(.leading,18)
                            
                        Spacer()
                    }.padding([.bottom,.top])
                    
                    HStack() {
                        Toggle("", isOn: $orderStatuses)
                            .toggleStyle(CheckboxToggleStyle()).padding(.leading,20)
                        Text("Order Statuses")
                        Spacer()
                    }.padding(.bottom)
                   
                    HStack() {
                        Toggle("", isOn: $passwordChanges)
                            .toggleStyle(CheckboxToggleStyle()).padding(.leading,20)
                        Text("Password Changes")
                        Spacer()
                    }.padding(.bottom)
                    
                    HStack() {
                        Toggle("", isOn: $specialOffers)
                            .toggleStyle(CheckboxToggleStyle()).padding(.leading,20)
                        Text("Special Offers")
                        Spacer()
                    }.padding(.bottom)
                    
                    HStack() {
                        Toggle("", isOn: $newsLetter)
                            .toggleStyle(CheckboxToggleStyle()).padding(.leading,20)
                        Text("Newsletter")
                        Spacer()
                    }.padding(.bottom)
                
                    
                    
                    Button("Logout"){
                        UserDefaults.standard.set(false, forKey: kIsLoggedIn)

                        // Remove all entries from UserDefaults
                        if let bundleIdentifier = Bundle.main.bundleIdentifier {
                            UserDefaults.standard.removePersistentDomain(forName: bundleIdentifier)
                        }

                        isLoggedOut = true
                    }.foregroundColor(.primaryColor1)
                        .padding()
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity)
                        .background(Color.secondaryColor1,in: RoundedRectangle(
                            cornerRadius: 8,
                            style: .continuous
                        )) .padding()
                            .navigationDestination(isPresented: $isLoggedOut){
                               
                               
                               OnboardingView().navigationBarBackButtonHidden(true)
                           
                       }
                       
                    Spacer()
                    
                    HStack{
                        
                        Button("Discard changes"){
                            
                            firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
                            lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
                            email = UserDefaults.standard.string(forKey: kEmail) ?? ""
                            phone = UserDefaults.standard.string(forKey: kPhone) ?? ""
                            
                            orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
                            newsLetter = UserDefaults.standard.bool(forKey: kNewsLetter)
                            passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
                            specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
                            
                            
                        }.foregroundColor(.primaryColor1)
                            .fontWeight(Font.Weight.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .border(.black)
                            .cornerRadius(3.5)
                             .padding(.leading)
                        
                        Button("Save changes"){
                          
                            
                            
                            if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                                // Store user data in UserDefaults
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                                UserDefaults.standard.set(lastName, forKey: kLastName)
                                UserDefaults.standard.set(email, forKey: kEmail)
                                UserDefaults.standard.set(phone, forKey: kPhone)
                                 
                                UserDefaults.standard.set(orderStatuses,forKey: kOrderStatuses)
                                UserDefaults.standard.set(newsLetter,forKey: kNewsLetter)
                                UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                                UserDefaults.standard.set( passwordChanges,forKey: kSpecialOffers)
                                                    
                              
                               
                            }
                            
                            
                        }.foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryColor1,in: RoundedRectangle(
                                cornerRadius: 8,
                                style: .continuous
                            )) .padding(.trailing)
                    }
                    
                }
                .onAppear(){
                    
                    firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
                    lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
                    email = UserDefaults.standard.string(forKey: kEmail) ?? ""
                    phone = UserDefaults.standard.string(forKey: kPhone) ?? ""
                    
                    orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
                    newsLetter = UserDefaults.standard.bool(forKey: kNewsLetter)
                    passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
                    specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
                }
            }
         
//            .navigationBarTitle("", displayMode: .inline)
        }.navigationBarBackButtonHidden(true)
      
    }
}

#Preview {
    UserProfileView()
}

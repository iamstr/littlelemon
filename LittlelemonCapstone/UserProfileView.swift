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
    let kIsLoggedIn = "kIsLoggedIn"
    @Environment(\.presentationMode) var presentation
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var orderStatuses = false
    @State private var passwordChanges = false
    @State private var specialOffers = false
    @State private var newsLetter = false
    

    var body: some View {
        NavigationView{
            
            
                VStack(alignment:.leading){
                    
                    HStack {
                       
                        Image(systemName: "arrowshape.left.circle.fill")
                            .font(.system(size: 26))
                            .padding(.leading)
                            .foregroundColor(.primaryColor1)

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
                        Text("Last Name")
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
                        self.presentation.wrappedValue.dismiss()
                    }.foregroundColor(.primaryColor1)
                        .padding()
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity)
                        .background(Color.secondaryColor1,in: RoundedRectangle(
                            cornerRadius: 8,
                            style: .continuous
                        )) .padding()
                       
                    Spacer()
                    
                    HStack{
                        
                        Button("Discard changes"){
                            
                            firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
                            lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
                            email = UserDefaults.standard.string(forKey: kEmail) ?? ""
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
                                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                              
                               
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
                }
            }
         
//            .navigationBarTitle("", displayMode: .inline)
        }.navigationBarBackButtonHidden(true)
      
    }
}

#Preview {
    UserProfileView()
}

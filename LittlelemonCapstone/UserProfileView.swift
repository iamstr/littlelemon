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
    @State private var doesClose = false

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
               
                HStack {
                    Text("Personal information")
                        .font(.title2)
                        .multilineTextAlignment(.leading)
//                        .frame(maxWidth: .infinity)
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
                    Toggle("", isOn: $doesClose)
                        .toggleStyle(CheckboxToggleStyle()).padding(.leading,20)
                    Text("Order Statuses")
                    Spacer()
                }.padding(.bottom)
               
                HStack() {
                    Toggle("", isOn: $doesClose)
                        .toggleStyle(CheckboxToggleStyle()).padding(.leading,20)
                    Text("Password Changes")
                    Spacer()
                }.padding(.bottom)
                
                HStack() {
                    Toggle("", isOn: $doesClose)
                        .toggleStyle(CheckboxToggleStyle()).padding(.leading,20)
                    Text("Special Offers")
                    Spacer()
                }.padding(.bottom)
                
                HStack() {
                    Toggle("", isOn: $doesClose)
                        .toggleStyle(CheckboxToggleStyle()).padding(.leading,20)
                    Text("Email Notificatitons")
                    Spacer()
                }.padding(.bottom)
            
                
                
                Button("Logout"){
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                }.foregroundColor(.primaryColor1)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.secondaryColor1,in: RoundedRectangle(
                        cornerRadius: 8,
                        style: .continuous
                    )) .padding()
                   
                Spacer()
            }.onAppear(){
                
                firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
                lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
                email = UserDefaults.standard.string(forKey: kEmail) ?? ""
            }
            .navigationBarTitle("", displayMode: .inline)
        }.navigationBarBackButtonHidden(true)
      
    }
}

#Preview {
    UserProfileView()
}

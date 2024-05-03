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

    var body: some View {
        NavigationView{
            
            
            VStack{
                
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
                Text("Personal information")
                
                
                Text(UserDefaults.standard.string(forKey: kFirstName) ?? "")
                Text(UserDefaults.standard.string(forKey: kLastName) ?? "")
                Text(UserDefaults.standard.string(forKey: kEmail) ?? "")
                
                
                
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
            }
            .navigationBarTitle("", displayMode: .inline)
        }.navigationBarBackButtonHidden(true)
      
    }
}

#Preview {
    UserProfileView()
}

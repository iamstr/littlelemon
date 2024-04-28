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
        VStack{
            Text("Personal information")
         
            Image("profile-image-placeholder")
            Text(UserDefaults.standard.string(forKey: kFirstName) ?? "")
            Text(UserDefaults.standard.string(forKey: kLastName) ?? "")
            Text(UserDefaults.standard.string(forKey: kEmail) ?? "")
            
            Button("Logout"){
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
      
    }
}

#Preview {
    UserProfileView()
}

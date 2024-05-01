//
//  TopNavView.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 01/05/2024.
//

import SwiftUI

struct TopNavView: View {
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            HStack {
                ZStack {
                    Image("Logo")
                    HStack {
                        Spacer()
                        if(isLoggedIn){
                            
                            NavigationLink(destination: UserProfileView()) {
                                Image("profile-image-placeholder")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    
                                    .clipShape(Circle())
                                    .frame(maxHeight: 70)
                                    .padding(.trailing)
                            }
                        }

                        
                    }
                }
            }
        }
        .frame(maxHeight: 30)
        .padding(.bottom)
        .onAppear() {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
    }
}


#Preview {
    TopNavView()
}

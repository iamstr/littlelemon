//
//  NotificationView.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 05/05/2024.
//

import SwiftUI

struct NotificationView: View {
    @State private var phone: String = ""
    
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var isLoggedIn = false
    @State private var orderStatuses = false
    @State private var passwordChanges = false
    @State private var specialOffers = false
    @State private var newsLetter = false
   
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
                    
                    
                    
                    
                    
                    NavigationLink(destination: OnboardingView2().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("Go Back")
                                .foregroundColor(.primaryColor1)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                            Spacer()
                        }
                        
                        
                    }
                    
                    
                    
                    
                    // Button to register user
                    Button("Start Ordering") {
                        
                        
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
    
                        UserDefaults.standard.set(orderStatuses,forKey: kOrderStatuses)
                        UserDefaults.standard.set(newsLetter,forKey: kNewsLetter)
                        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                        UserDefaults.standard.set( passwordChanges,forKey: kSpecialOffers)
                        
                        
                        isLoggedIn = true
                        
                    }.padding()
                        .frame(maxWidth: .infinity)
                    
                        .background(Color.primaryColor1,in: RoundedRectangle(
                            cornerRadius: 16,
                            style: .continuous
                        ))
                    
                        .foregroundColor(.white)
                        .padding([.leading, .bottom, .trailing]) .navigationDestination(isPresented: $isLoggedIn){
                            
                            
                            HomeView().navigationBarBackButtonHidden(true)
                        }
                    
                    Spacer()
                    
                }
                
            }
            
            .navigationBarBackButtonHidden(true)
            
        
    }
}

#Preview {
    NotificationView()
}

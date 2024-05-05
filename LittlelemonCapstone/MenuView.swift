//
//  MenuView.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 28/04/2024.
//

import SwiftUI




struct MenuView: View {
    
    @State private var searchText = ""
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentation
    @State private var isLoggedOut=false
    @State var startersIsToggled = false
    @State var mainsIsToggled = false
    @State var dessertsIsToggled = false
    @State var drinksIsToggled = false
    
    func getMenuData() {
            // Clear the database before fetching new data
            PersistenceController.shared.clear()
            
            // Define server URL string
            let serverURLString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
            
            // Initialize URL object from server URL string
            guard let url = URL(string: serverURLString) else {
                print("Invalid server URL")
                return
            }
            
            // Create URLRequest instance from URL object
            let request = URLRequest(url: url)
            
            // Create URLSession instance
            let session = URLSession.shared
            
            // Create data task with request and handle response
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        // Initialize JSONDecoder instance
                        let decoder = JSONDecoder()
                        
                        // Decode data into MenuList model
                        let menuList = try decoder.decode(MenuList.self, from: data)
                        
                        // Access menu property of result and iterate over each menu item
                        for menuItem in menuList.menu {
                            // Initialize a new Dish instance and store it into a constant
                            let dish = Dish(context: PersistenceController.shared.container.viewContext)
                            
                            // Set title, image, and price from the menu item properties
                            dish.title = menuItem.title
                            dish.image = menuItem.image
                            dish.price = menuItem.price
                            dish.desc = menuItem.description
                            dish.category = menuItem.category
                        }
                        
                        // Save the data into the database
                        try?
                        PersistenceController.shared.container.viewContext.save()
                        
                    } catch {
                        print("Error decoding JSON data: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error fetching menu data: \(error.localizedDescription)")
                }
            }
            
            // Resume data task
            dataTask.resume()
        }
    
     func buildSortDescriptors() -> [NSSortDescriptor] {
           return [NSSortDescriptor(key: "title",
                                     ascending: true,
                                     selector:
                                       #selector(NSString.localizedStandardCompare))]
       }
    func buildPredicate() -> NSPredicate {
        var predicates = [NSPredicate]()
        
        // Add predicate for searchText
        if !searchText.isEmpty {
            let searchTextPredicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            predicates.append(searchTextPredicate)
        }
        
        // Add predicates for toggled states
        if startersIsToggled {
            let startersPredicate = NSPredicate(format: "category == %@", "starters")
            predicates.append(startersPredicate)
        }
        
        if mainsIsToggled {
            let mainsPredicate = NSPredicate(format: "category == %@", "mains")
            predicates.append(mainsPredicate)
        }
        
        if dessertsIsToggled {
            let dessertsPredicate = NSPredicate(format: "category == %@", "desserts")
            predicates.append(dessertsPredicate)
        }
        
        if drinksIsToggled {
            let drinksPredicate = NSPredicate(format: "category == %@", "drinks")
            predicates.append(drinksPredicate)
        }
        
        // Combine predicates with AND operator
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        
        return compoundPredicate
    }

    
    var body: some View {
        VStack{
            TopNavView()
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Little Lemon")
                            .foregroundColor(Color(hex:"#F4CE14"))
                            .font(.title)
                            .padding(.leading)
                            .padding(.top)
                        
                        Text("Chicago")
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding(.leading)
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .foregroundColor(.white)
                            .font(.subheadline).frame(width:.infinity)
                            .padding([.leading, .bottom])
                    }.padding(.horizontal)
                    Spacer()
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 120, maxHeight: 140)
                        .clipShape(Rectangle())
                        .cornerRadius(16)
                }
                
                
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(MyTextFieldStyle())
                
                
                
            }.padding(.bottom,10)
                .background(Color.primaryColor1)
            
            
            
            Text("ORDER FOR DELIVERY!")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Toggle("Starters", isOn: $startersIsToggled)
                    Toggle("Mains", isOn: $mainsIsToggled)
                    Toggle("Desserts", isOn: $dessertsIsToggled)
                    Toggle("Drinks", isOn: $drinksIsToggled)
                }
                .toggleStyle(CategoryToggle())
                .padding(.horizontal)
            }
            
            Divider().padding([.top, .leading, .trailing])
        
   
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                           List(dishes, id: \.self) { dish in
 MenuItemView(dish: dish)
                           }.listStyle(.plain).padding([.horizontal])
                       }
            .onAppear {
            
                isLoggedOut = UserDefaults.standard.bool(forKey: kIsLoggedIn)
                
                
                getMenuData()
            }
            
          
            
        }    .navigationDestination(isPresented: $isLoggedOut){
            
            
            OnboardingView().navigationBarBackButtonHidden(true)
        
    }
    }
}




#Preview {
    MenuView()
}

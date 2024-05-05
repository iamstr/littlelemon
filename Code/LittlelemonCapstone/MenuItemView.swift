//
//  MenuItemView.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 30/04/2024.
//

import SwiftUI

struct MenuItemView: View {
    let dish:Dish
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading){
                Text("\(dish.title ?? "") ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 3.0)
                
                Text("\(dish.desc ?? "")").lineLimit(2).contrast(0.2)
                Spacer(minLength: 1)
                Text("$\(dish.price ?? "")").monospaced() .font(.title3)
                    .fontWeight(.medium)
            }
           
           Spacer()
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 85, maxHeight: 85)
            .clipShape(Rectangle())
        }.padding(.vertical)
    }
}

//#Preview {
//    @Environment(\.managedObjectContext)  var viewContext
//    @FetchRequest(entity: Dish.entity(), sortDescriptors: [])
//       var dishes: FetchedResults<Dish>
//    MenuItemView(dish: dishes[0])
//}

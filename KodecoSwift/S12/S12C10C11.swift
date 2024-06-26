//
//  S12C10C11.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/14.
//

import SwiftUI

struct S12C10C11: View {
    @State private var selection = 0
    @State private var showIngredients = false
    @State private var selectedFood = "Pizza"
    let foodItems = ["Pizza", "Burger", "Pasta"]
    
    var body: some View {
        VStack {
            // 绑定值动画
            Text("Your selection is: \(selection)")
                .font(.title)
            
            Picker("Choose a number", selection: $selection.animation()) {
                ForEach(0..<10) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.wheel)
            .frame(width: 100, height: 200)
            
            // 过渡动画
            Picker(selection: $selectedFood) {
                ForEach(foodItems, id: \.self) {
                    Text($0)
                }
            } label: {
                Text("Please choose a food")
            }
            
            Button {
                withAnimation {
                    showIngredients.toggle()
                }
            } label: {
                Text(showIngredients ? "Hide Ingredients" : "Show Ingredients")
            }
            .padding()
            
            if showIngredients {
                IngredientView(food: selectedFood)
                // 转场动画
                    .transition(.move(edge: .leading))
            }
            Spacer()
        }
    }
}

struct IngredientView: View {
    let food: String
    
    var ingredients: [String] {
        switch food {
        case "Pizza": return ["Dough", "Tomato Sauce", "Cheese", "Toppings"]
        case "Burger": return ["Bun", "Patty", "Lettuce", "Tomato", "Sauce"]
        case "Pasta": return ["Pasta", "Olive oil", "Garlic", "Tomato Sauce"]
        default: return []
        }
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(food) Ingredients")
                .font(.headline)
                .padding(.top)
            ForEach(ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.blue.opacity(0.2))
        .cornerRadius(10)
    }
}

struct S12C10C11_Previews: PreviewProvider {
    static var previews: some View {
        S12C10C11()
    }
}

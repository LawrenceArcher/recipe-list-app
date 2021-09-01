//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Lawrence Archer on 27/08/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients, id: \.self) { item in
                        Text("• \(item)")
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack (alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
           
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass into detail view to see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}

//
//  ContentView.swift
//  Recipe List App
//
//  Created by Lawrence Archer on 26/08/2021.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            List(model.recipes){ r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height:50, alignment:.center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                    }
                )
                
               
            }
            .navigationBarTitle("All Recipes")
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}

//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Lawrence Archer on 02/09/2021.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    
    var body: some View {
        VStack (alignment: .leading, spacing:0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                
            
        GeometryReader { geo in
            // Building card view here
            TabView {
                // need to check each recipe to see if they are featured and show if they are
                ForEach (0..<model.recipes.count) { index in
                    if model.recipes[index].featured == true {
                        
                        //Recipe card button
                        Button(action: {
                            //Show the recipe detail sheet
                            self.isDetailViewShowing = true
                            
                        }, label: {
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack (spacing:0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }
                            
                        })
                        .sheet(isPresented: $isDetailViewShowing){
                            // Show the recipe detail view
                            RecipeDetailView(recipe: model.recipes[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        
                    }
                    
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
            
            VStack (alignment: .leading) {
                Text("Preparation time:")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
        }
        
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}

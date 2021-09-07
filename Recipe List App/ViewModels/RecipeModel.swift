//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Lawrence Archer on 26/08/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // Create instance of data service and get the data
        
        self.recipes = DataService.getLocalData()
        
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        // get a single serving size by multiplying denominator by recipe servings
        
        // get a target portion by multiplying numerator by target servings
        
        // Reduce fraction by greatest common divisor
        
        // Get the whole portion if numerator > denominator
        
        // Express the remainder as a fraction
        
        
        return String(targetServings)
    }
}

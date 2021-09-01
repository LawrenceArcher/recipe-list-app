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
        
        //set the recipes property
    }
}

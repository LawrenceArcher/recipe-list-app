//
//  DataService.swift
//  Recipe List App
//
//  Created by Lawrence Archer on 26/08/2021.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // Parse local JSON file
        
        // Get a url path to the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise return empty array
        guard pathString != nil else {
            return [Recipe]()
        }
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add in unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                // return the recipe data
                return recipeData
                
            } catch {
                //error wtih parsing JSON
                print(error)
            }
        } catch {
            // error with getting data
            print(error)
        }
        return [Recipe]()
        
       
    }
}

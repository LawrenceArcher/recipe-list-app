//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Lawrence Archer on 07/09/2021.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        //Loop throught the hightlights and build the string
        for index in 0..<highlights.count {
            //if this is the last item, do not add comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2"])
    }
}

//
//  Ingredient.swift
//  Recipe List App
//
//  Created by Lawrence Archer on 02/09/2021.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}

//
//  Country.swift
//  EuroFlags
//
//  Created by Mohammad Hazimeh on 26/10/2024.
//

import Foundation


struct CountryResult:Codable {
    var name: CountryName
    var capital: [String]
    var flags: CountryFlag

}
struct CountryName:Codable {
 
    var common:String
}
struct CountryCapital:Codable {
    
    var capital: String
}

struct CountryFlag:Codable {
    
    var png:String
}

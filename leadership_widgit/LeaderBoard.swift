//
//  LeaderBoard.swift
//  leadership_widgit
//
//  Created by Yu Hong on 2021/1/5.
//

import Foundation


struct Leadership : Identifiable, Codable{
    let score: String
    let desc: String
    
    var id:String {score}
}

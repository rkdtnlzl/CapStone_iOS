//
//  LearningModel.swift
//  CapStone
//
//  Created by 강석호 on 12/6/23.
//

import Foundation

struct LoginResponse: Codable {
    let code: Int
    let result: String
    let message: String
    let data: [DetailCafeMenu]
}

struct DetailCafeMenu: Codable {
    let menuId: Int
    let name: String
    let description: String
    let price: Int
    let imageUrl: String
}

//
//  LearningModel.swift
//  CapStone
//
//  Created by 강석호 on 12/6/23.
//

import Foundation


struct LearningResponse: Codable {
    let lable: String
    let confidence: Double
    let disease_image: String
    let disease_id: Int
    let simple_description: String
}

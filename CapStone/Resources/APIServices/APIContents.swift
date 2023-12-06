//
//  APIContents.swift
//  CapStone
//
//  Created by 강석호 on 12/6/23.
//

import Foundation


struct APIConstants {
    // MARK: -  Base URL
    static let flask_baseURL = "http://13.209.66.222:5000"
    static let spring_baseURL = "http://52.79.226.179:8080/"
    
    // MARK: - Feature URL
    static let learningURL = flask_baseURL + "/predict/1" // 이미지 학습 Post URL
    
}

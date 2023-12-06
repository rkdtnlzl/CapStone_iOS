//
//  LearningService.swift
//  CapStone
//
//  Created by 강석호 on 12/6/23.
//

import Foundation
import Alamofire
import UIKit

class LearningService {
    static let shared = LearningService()

    private init() {}

    func uploadImage(image: UIImage, completion: @escaping (NetworkResult<Any>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            completion(.pathErr)
            return
        }

        let url = APIConstants.learningURL // 서버 엔드포인트에 맞게 수정

        let headers: HTTPHeaders = ["Content-Type": "multipart/form-data"]

        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "file", fileName: "image.jpg", mimeType: "image/jpeg")
            // 필요에 따라 다른 필드를 추가하려면 여기에 추가 가능
        }, to: url, method: .post, headers: headers)
        .responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    completion(.networkFail)
                    return
                }

                let networkResult = self.judgeStatus(by: statusCode, response.data!)
                completion(networkResult)

            case .failure:
                completion(.networkFail)
            }
        }
    }

    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case ..<300: return isValidData(data: data)
        case 400..<500: return .pathErr
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }

    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LearningResponse.self, from: data) else {
            return .pathErr
        }

        return .success(decodedData as Any)
    }
}

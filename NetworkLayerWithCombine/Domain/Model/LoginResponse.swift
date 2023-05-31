//
//  LoginResponse.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import Foundation

struct LoginResponse: Codable {
    let status: Bool
    let message: String
    let data: UserModel?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }
}

// MARK: - UserModel
struct UserModel: Codable {
    let userID: Int?
    let firstname, lastmane: String?

}

//
//  LoginServiceProtocol.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import Foundation
import Combine

protocol LoginServiceProtocol {
    func login(request: LoginDTO) -> AnyPublisher<LoginResponse, NetworkError>
}

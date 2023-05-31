//
//  LoginService.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import Foundation
import Combine

class LoginService: LoginServiceProtocol {
    
    private var networkRequest: Requestable
    
    // inject this for testability
    init(networkRequest: Requestable = NativeRequestable()) {
        self.networkRequest = networkRequest
    }
    
    func login(request: LoginDTO) -> AnyPublisher<LoginResponse, NetworkError> {
        let endpoint = AuthServiceEndpoints.login(request: request)
        let request = endpoint.createRequest()
        return self.networkRequest.request(request)
    }

}

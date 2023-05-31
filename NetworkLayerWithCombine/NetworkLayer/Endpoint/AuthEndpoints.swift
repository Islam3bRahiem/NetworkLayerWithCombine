//
//  AuthEndpoints.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import Foundation

enum AuthServiceEndpoints {
    
    case login(request: LoginDTO)
    
    var baseURL: String {
        return AppConfiguration().apiBaseURL
    }
    
    var requestTimeOut: Int {
        return 30
    }
        
    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .POST
        }
    }
    
    var requestBody: Encodable? {
        switch self {
        case .login(let request):
            return request
        }
    }
    
    func getURL() -> String {
        return self.baseURL + self.path
    }
    
    func createRequest() -> NetworkRequest {
        
        printIfDebug("request: \(getURL())")
        printIfDebug("method: \(httpMethod)")
        printIfDebug("body: \(requestBody ?? "")")
        
        return NetworkRequest(url: getURL(),
                              headers: AppConfiguration().headers,
                              reqBody: requestBody,
                              httpMethod: httpMethod)
    }

}

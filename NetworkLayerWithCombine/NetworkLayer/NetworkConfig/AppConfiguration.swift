//
//  AppConfiguration.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import Foundation

final class AppConfiguration {
        
    // MARK: - List of Constants
    lazy var apiBaseURL: String = {
        //Set your base url here
        return "https://www.google.com/reset/v1/"
    }()
    
    lazy var ApiToken: String = {
        //Set user token here
        return "Bearer token"
    }()
    
    lazy var headers: [String: String] = {
        let headers: [String: String] = [
            "Content-Type": "application/json",
            "token": self.ApiToken,
            "DeviceType": "IOS",
            "Token": "authtoken"
        ]
        return headers
    }()

}


//
//  Endpoints+RequestBuild.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import UIKit
import Foundation

extension Endpoints: Endpoint {
    var request: URLRequest? {
        switch self {
        case .users: return request(forPath: "/users")
        }
    }
    
    var httpMethod: String {
        switch self {
        case .users: return "GET"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .users: return nil
        }
    }
    
    var requestHeaders: [String : String]? {
        switch self {
        case .users: return nil
        }
    }
    
    var requestBody: Data? {
        switch self {
        case .users: return nil
        }
    }
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return Constants.host
    }
}

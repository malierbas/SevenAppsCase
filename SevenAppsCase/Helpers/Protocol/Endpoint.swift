//
//  Endpoint.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import Foundation

protocol Endpoint {
    var request: URLRequest? { get }
    var httpMethod: String { get }
    var queryItems: [URLQueryItem]? { get }
    var requestHeaders: [String: String]? { get }
    var requestBody: Data? { get }
    var scheme: String { get }
    var host: String { get }
}


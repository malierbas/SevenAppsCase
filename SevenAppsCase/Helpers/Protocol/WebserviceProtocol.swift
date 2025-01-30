//
//  WebserviceProtocol.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import Foundation

protocol WebserviceProtocol {
    func request<T: Codable>(_ endpoint: Endpoint) async throws -> T
}

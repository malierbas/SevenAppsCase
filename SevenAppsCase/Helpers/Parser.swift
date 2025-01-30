//
//  Parser.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import UIKit
import Foundation

struct Parser {
    let jsonDecoder = JSONDecoder()
    
    func json<T: Decodable>(data: Data) throws -> T {
        do {
            let responseModel = try JSONDecoder().decode(T.self, from: data)
            return responseModel
        } catch {
            throw error
        }
    }
    
    func getModel<T: Decodable>(from data: Data) -> T? {
        return try? jsonDecoder.decode(T.self, from: data)
    }
}

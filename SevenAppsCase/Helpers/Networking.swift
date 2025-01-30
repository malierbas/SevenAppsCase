//
//  Networking.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import UIKit
import Foundation

final class Networking: WebserviceProtocol {
    // url session, parser
    private let urlSession: URLSession
    private let parser: Parser
    public static var shared = Networking()
    
    //init
    init(urlSession: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
        self.urlSession = urlSession
        self.parser = Parser()
    }
    
    func request<T: Codable>(_ endpoint: Endpoint) async throws -> T {
        guard let request = endpoint.request else {
            throw NetworkStackError.invalidRequest
        }
        //: log items
        print("----------------------------REQUEST:\nURL:\(request.description),\nHeaders: \(String(describing: request.allHTTPHeaderFields)),\nHttpBody: \(String(data: (request.httpBody ?? nil) ?? Data(), encoding: .utf8) ?? "nil.") \n----------------------------END")
        
        //: get task
        let urlSession: URLSession = .init(configuration: .default)
        let (data, response) = try await urlSession.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {throw NetworkStackError.dataMissing}
        let statusCode = httpResponse.statusCode
        print("----------response status code: ", httpResponse.statusCode)
        if statusCode > 201 {
            throw NetworkStackError.requestNotSuccessful(errorMessage: String(data: data, encoding: .utf8) ?? "Unknown error occured.", statusCode: statusCode)
        }
        
        //: log data response
        //
        print("---------\nrespose data string = ", String(data: data, encoding: .utf8) ?? "nil.")
        //: parse json and return
        //: parse if data is not nil
        let decodedModel: T = try parser.json(data: data)
        return decodedModel
    }
}

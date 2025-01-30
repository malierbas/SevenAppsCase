//
//  NetworkStackError.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import Foundation

enum NetworkStackError: Error {
    case authError
    case serializationError
    case invalidRequest
    case dataMissing
    case emailAlreadyTaken
    case invalidEmailOrPassword
    case requestNotSuccessful(errorMessage: String, statusCode: Int)
}

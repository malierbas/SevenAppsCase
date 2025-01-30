//
//  Constants.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import Foundation

//the full request url: https://jsonplaceholder.typicode.com/users
enum Constants {
    static var hostType: HostType = .dev
    static var host: String! {
        get {
            switch hostType {
            case .prod: return "jsonplaceholder.typicode.com"
            case .dev: return "jsonplaceholder.typicode.com"
            }
        }
    }
}

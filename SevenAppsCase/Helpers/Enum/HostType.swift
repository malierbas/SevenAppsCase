//
//  HostType.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import Foundation

enum HostType: String, Codable {
    case prod
    case dev
    
    init?(rawValue: String) {
        self = if rawValue == "prod" { .prod } else { .dev }
    }
}

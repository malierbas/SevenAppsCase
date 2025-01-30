//
//  UsersViewModel.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import UIKit
import Foundation

class UsersViewModel {
    private var containerView: UIViewController
    private var networking: Networking
    
    init(containerView: UIViewController) {
        self.containerView = containerView
        self.networking = Networking.shared
    }
    
    // fetch users
    func fetchUsers() async throws -> [User] {
        return try await networking.request(Endpoints.users)
    }
}

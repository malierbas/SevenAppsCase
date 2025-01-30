//
//  UserDetailViewController.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import UIKit

class UserDetailViewController: UIViewController {
    //IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    //variables
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setup
        setupView()
    }

    private func setupView() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        
        nameLabel.text = user?.name
        emailLabel.text = user?.email
        phoneLabel.text = user?.phone
        websiteLabel.text = user?.website
    }
}

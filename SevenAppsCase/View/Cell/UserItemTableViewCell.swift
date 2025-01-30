//
//  UserItemTableViewCell.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import UIKit

protocol UserItemCellDelegate {
    func didSelect(_ cell: UserItemTableViewCell, user: User?)
}

class UserItemTableViewCell: UITableViewCell {
    //Iboutlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    //variables
    static var reuseIdentifier: String = "UserItemTableViewCell"
    var delegate: UserItemCellDelegate? = nil
    var user: User? = nil {didSet{
        setupCell()
    }}
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //Tap gesture for recognizing selected user
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapCell))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        usernameLabel.text = nil
        emailLabel.text = nil
    }
    
    //setup cell
    private func setupCell() {
        usernameLabel.text = user?.username
        emailLabel.text = user?.email
    }
    
    //action
    @objc
    private func didTapCell() {
        delegate?.didSelect(self, user: user)
    }
}

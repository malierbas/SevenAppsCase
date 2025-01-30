//
//  UsersViewController.swift
//  SevenAppsCase
//
//  Created by Mehmet Ali Erbaş on 1/30/25.
//

import UIKit

class UsersViewController: UIViewController {
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //variables
    private var users: [User] = []
    private var viewModel: UsersViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Users"
    }
    
    private func setupView() {
        viewModel = UsersViewModel(containerView: self)
        tableView.register(.init(nibName: "UserItemTableViewCell", bundle: nil), forCellReuseIdentifier: UserItemTableViewCell.reuseIdentifier)
        tableView.isHidden = true
        fetchData()
    }
    
    //fetch data
    private func fetchData() {
        Task {
            do {
                let result = try await viewModel?.fetchUsers()
                if (result ?? []).isEmpty {
                    print("result is empty")
                    return
                }
                
                users = result ?? []
                tableView.isHidden = false
                tableView.dataSource = self
                tableView.reloadData()
            } catch let fetchError {
                print("an fetch error occureD: ", fetchError.localizedDescription)
            }
        }
    }
    
    //cell action
    private func didUserSelected(_ user: User?) {
        let detailView = UserDetailViewController()
        detailView.user = user
        navigationController?.pushViewController(detailView, animated: true)
    }
}

extension UsersViewController: UITableViewDataSource, UserItemCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserItemTableViewCell", for: indexPath) as! UserItemTableViewCell
        cell.user = users[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func didSelect(_ cell: UserItemTableViewCell, user: User?) {
        didUserSelected(user)
    }
}

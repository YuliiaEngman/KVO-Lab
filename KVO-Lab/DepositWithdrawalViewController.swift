//
//  DepositWithdrawalViewController.swift
//  KVO-Lab
//
//  Created by Yuliia Engman on 4/7/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class DepositWithdrawalViewController: UIViewController {
    
    //    private var users = [User]() {
    //        didSet {
    //            tableView.reloadData()
    //        }
    //    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var arrayOfUsersObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        tableView.reloadData()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension DepositWithdrawalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Accounts.shared.arayOfUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath)
        
        arrayOfUsersObservation = Accounts.shared.observe(\.arayOfUsers, options: [.new], changeHandler: { [weak self] (settings, change) in
            let userAccount = change.newValue![indexPath.row]
            cell.textLabel?.text = userAccount.name
            cell.detailTextLabel?.text = String(userAccount.balance)
        })
        return cell
    }
}

extension DepositWithdrawalViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DepositDetailViewController()
        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("could not downcast to DepositDetailViewController")
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}



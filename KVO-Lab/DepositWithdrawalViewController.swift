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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    private func configureTableView() {
           tableView.dataSource = self
           tableView.delegate = self
       }
}

extension DepositWithdrawalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath)
        //let user = users[indexPath.row]
        cell.textLabel?.text = "Name"
        cell.detailTextLabel?.text = "Amount"
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

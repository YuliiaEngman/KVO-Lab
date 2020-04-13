//
//  UserInfoViewController.swift
//  KVO-Lab
//
//  Created by Yuliia Engman on 4/7/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var arrayOfUsersObservation: NSKeyValueObservation?
    
    // is it array of Users or Accounts?
    private var arrayOfUsers =  Accounts.shared.arrayOfUsers {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        //tableView.reloadData()
        loadData()
        configureUserArrayObservation()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
    }
    
    private func loadData() {
        arrayOfUsers = Accounts.shared.arrayOfUsers
    }
    
    private func configureUserArrayObservation() {
        arrayOfUsersObservation = Accounts.shared.observe(\.arrayOfUsers, options: [.old, .new], changeHandler: { [weak self](settings, change) in
            guard let usersArray = change.newValue else { return }
            self?.arrayOfUsers = usersArray
        })
    }

}

extension UserInfoViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return arrayOfUsers.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath)
          
          //        arrayOfUsersObservation = Accounts.shared.observe(\.arrayOfUsers, options: [.new], changeHandler: { (settings, change) in
          //let userAccount = change.newValue![indexPath.row]
          let user = arrayOfUsers[indexPath.row]
          cell.textLabel?.text = user.name
          cell.detailTextLabel?.text = String(user.balance)
          return cell
      }
}

//
//  UserInfoViewController.swift
//  KVO-Lab
//
//  Created by Yuliia Engman on 4/7/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
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
    }

}

extension UserInfoViewController: UITableViewDataSource {
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

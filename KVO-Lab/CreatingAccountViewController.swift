//
//  ViewController.swift
//  KVO-Lab
//
//  Created by Yuliia Engman on 4/7/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class CreatingAccountViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var balanceTextField: UITextField!
    
    @IBOutlet weak var testUsernameObserver: UILabel!
    @IBOutlet weak var testUserBalanceObserver: UILabel!
    @IBOutlet weak var arrayOfUsersLabel: UILabel!
    
    private var userObservation: NSKeyValueObservation?
    private var balanceObservation: NSKeyValueObservation?
    
    private var arrayOfUsersObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUserNameObservation()
        configureUserBalanceObservation()
        
        configureUserArrayObservation()
    }
    
    private func configureUserNameObservation() {
        userObservation = User.shared.observe(\.name, options: [.new], changeHandler: { [weak self](settings, change) in
            guard let userName = change.newValue else { return }
            self?.testUsernameObserver.text = userName
        })
    }
    
    private func configureUserBalanceObservation() {
           balanceObservation = User.shared.observe(\.balance, options: [.new], changeHandler: { [weak self](settings, change) in
               guard let userBalance = change.newValue else { return }
               self?.testUserBalanceObserver.text = String(userBalance)
           })
       }
    
    private func configureUserArrayObservation() {
        arrayOfUsersObservation = Accounts.shared.observe(\.arrayOfUsers, options: [.old, .new], changeHandler: { [weak self](settings, change) in
            guard let usersArray = change.newValue else { return }
            self?.arrayOfUsersLabel.text = (usersArray.last?.name ?? "name") + " " + String(usersArray.last?.balance.description ?? "00")
        })
    }
    
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        
        let userName = userNameTextField.text
        User.shared.name = userName ?? "no name"
        
        let userBalance = balanceTextField.text ?? "no balance"
        User.shared.balance = Double(userBalance) ?? 00
       
        let user = User()
        user.name = userName ?? "did not find name"
        user.balance = Double(userBalance) ?? 00
        
        Accounts.shared.arrayOfUsers.append(user)
        
        userNameTextField.text = ""
        balanceTextField.text = ""
        
        balanceTextField.resignFirstResponder()
    }
}


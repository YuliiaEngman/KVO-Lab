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
    
    
    // creating observer - since I decided to test observer inside this VC
    // seems like we need separate observatioon for separate properties
    private var userObservation: NSKeyValueObservation?
    private var balanceObservation: NSKeyValueObservation?
    
    private var arrayOfUsersObservation: NSKeyValueObservation?
    
    //let user = User()
    
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
        arrayOfUsersObservation = Accounts.shared.observe(\.arrayOfUsers, options: [.new], changeHandler: { [weak self](settings, change) in
            guard let usersArray = change.newValue else { return }
            self?.arrayOfUsersLabel.text = (usersArray.last?.name ?? "name") + " " + String(usersArray.last?.balance.description ?? "00")
        })
    }
    
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        //let user = User()
//        guard let userName = userNameTextField.text, !userName.isEmpty,
//            let balance = balanceTextField.text, !balance.isEmpty
//            else {
//                print("missing fields")
//                return
//        }
        
//        let newSize = Int(sender.value) // sender.value itselfFloat - we want to change from Float to the integer
//
//         //after setting the font size in the Settings class the Welcome VC will be updated via KVO
//        Settings.shared.fontSize = newSize
        
        let userName = userNameTextField.text
        User.shared.name = userName ?? "no name"
        
        let userBalance = balanceTextField.text ?? "no balance"
        User.shared.balance = Double(userBalance) ?? 00
        
        let accounts = [User]()
        Accounts.shared.arrayOfUsers = accounts
        
        // I can comment out this line of code
//        User.shared.name = userName
//        user.name = userName
        
        // I can uncomment out this line of code
//        User.shared.balance = Double(balance) ?? 0.0
//        user.balance = Double(balance) ?? 0.0
       
        let user = User()
        user.name = userName ?? "did not find name"
        user.balance = Double(userBalance) ?? 00
        Accounts.shared.arrayOfUsers.append(user)
        
//        let arrayOfUsers = Accounts()
//        print(arrayOfUsers.arrayOfUsers.first?.name)
        
        
        userNameTextField.text = ""
        balanceTextField.text = ""
        //arrayOfUsersLabel.text = arrayOfUsers.arrayOfUsers.first?.name ?? " " + String(arrayOfUsers.arrayOfUsers.first?.balance.description ?? "00.0")
        
        balanceTextField.resignFirstResponder()
    }
}


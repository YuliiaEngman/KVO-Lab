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
    
    // creating observer - since I decided to test observer inside this VC
    // seems like we need separate observatioon for separate properties
    private var userObservation: NSKeyValueObservation?
    private var balanceObservation: NSKeyValueObservation?
    
    let user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUserNameObservation()
        configureUserBalanceObservation()
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
    
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        //let user = User()
        guard let userName = userNameTextField.text, !userName.isEmpty,
            let balance = balanceTextField.text, !balance.isEmpty
            else {
                print("missing fields")
                return
        }
        
        User.shared.name = userName
        //user.name = userName
        User.shared.balance = Double(balance) ?? 0.0
        //user.balance = Double(balance) ?? 0.0
       
        Accounts.shared.arrayOfUsers.append(user)
        
        balanceTextField.resignFirstResponder()
    }
}


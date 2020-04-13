//
//  DepositDetailViewController.swift
//  KVO-Lab
//
//  Created by Yuliia Engman on 4/8/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class DepositDetailViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var testingUserNameLabel: UILabel!
    @IBOutlet weak var testingNewBalanceLabel: UILabel!
    
    
    // I need observation here as well to know from what balance to substract or add
    private var testUsernameObserver: NSKeyValueObservation?
    private var balanceObservation: NSKeyValueObservation?
    
    // I need pass user here too - that we will reffer to the same user

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Used this code for my own "visualization":
        testingUserNameLabel.text = ""
        testingNewBalanceLabel.text = ""

        //        configureUserNameObservation()
        //        configureUserBalanceObservation()
    }
    
//    private func configureUserNameObservation() {
//        balanceObservation = User.shared.observe(\.balance, options: [.new], changeHandler: { [weak self](settings, change) in
//            guard let userName = change.newValue else { return }
//            self?.testingUserNameLabel.text = String(userName)
//        })
//    }
//
//
//    private func configureUserBalanceObservation() {
//        balanceObservation = User.shared.observe(\.balance, options: [.new], changeHandler: { [weak self](settings, change) in
//            guard let userBalance = change.newValue else { return }
//            self?.testingNewBalanceLabel.text = String(userBalance)
//        })
//    }
    
    @IBAction func depositButtonPressed(_ sender: UIButton) {
        let oldUserBalance = User.shared.balance
        
        guard let deposit = amountTextField.text, !deposit.isEmpty else {
                    print("missing fields")
                    return
                    }
        
        User.shared.balance = oldUserBalance + Double(deposit)!

        amountTextField.resignFirstResponder()
    }

    
    @IBAction func withdrawButtonPressed(_ sender: UIButton) {
        
        let oldUserBalance = User.shared.balance
        
        guard let withdrawal = amountTextField.text, !withdrawal.isEmpty else {
                    print("missing fields")
                    return
                    }
        
        User.shared.balance = oldUserBalance - Double(withdrawal)!

        amountTextField.resignFirstResponder()
    }
}



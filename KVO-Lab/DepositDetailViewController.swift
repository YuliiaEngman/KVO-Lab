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
    
    // I need observation here as well to know from what balance to substract or add
    private var balanceObservation: NSKeyValueObservation?
    
    // I need pass user here too - that we will reffer to the same user

    override func viewDidLoad() {
        super.viewDidLoad()
        //configureUserBalanceObservation()
    }
    
//    private func configureUserBalanceObservation() {
//        balanceObservation = User.shared.observe(\.balance, options: [.old], changeHandler: { [weak self](settings, change) in
//            let userBalance = change.oldValue
//        })
//    }
    
    @IBAction func depositButtonPressed(_ sender: UIButton) {
        // + addint to the balance
        balanceObservation = User.shared.observe(\.balance, options: [.old], changeHandler: { [weak self](settings, change) in
            guard let oldUserBalance = change.oldValue else { return }
            
            guard let deposit = self?.amountTextField.text, !deposit.isEmpty else {
            print("missing fields")
            return
            }
            
            User.shared.balance = oldUserBalance + Double(deposit)!
            
            self?.amountTextField.resignFirstResponder()
    })
    }
    
    @IBAction func withdrawButtonPressed(_ sender: UIButton) {
        // - substracting from the balance
    }
    
}



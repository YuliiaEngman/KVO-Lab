//
//  Accounts.swift
//  KVO-Lab
//
//  Created by Yuliia Engman on 4/10/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import Foundation

// Settings needs to be KVO-complient
// @objc + inherit from NSOblect
@objc class Accounts: NSObject {
    static var shared = Accounts()
    @objc dynamic var arrayOfUsers = [User]()
//    override init() {
//        arrayOfUsers = []
//    }
}

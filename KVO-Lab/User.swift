//
//  User.swift
//  KVO-Lab
//
//  Created by Yuliia Engman on 4/10/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import Foundation

// Settings needs to be KVO-complient
// @objc + inherit from NSOblect
@objc class User: NSObject {
    static var shared = User()
    @objc dynamic var name: String
    @objc dynamic var balance: Double
    override private init() {
        name = ""
        balance = 0.0
    }
}

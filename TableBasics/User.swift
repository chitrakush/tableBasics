//
//  User.swift
//  TableBasics
//
//  Created by chitra on 21/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String
    let username: String
    let email: String
    struct Company: Codable {
        let name: String
    }
    let company: Company
    
}

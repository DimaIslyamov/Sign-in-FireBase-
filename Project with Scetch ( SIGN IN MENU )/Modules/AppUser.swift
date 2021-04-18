//
//  User.swift
//  Project with Scetch ( SIGN IN MENU )
//
//  Created by Moobat on 4/18/21.
//

import Foundation
import Firebase

struct AppUser {
    
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}

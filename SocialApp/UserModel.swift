//
//  UserModel.swift
//  SocialApp
//
//  Created by le tuan anh on 8/20/17.
//  Copyright © 2017 le tuan anh. All rights reserved.
//

import Foundation
struct UserModel {
    var userName: String
    var userId: String
    var picture: String
    init(with dictionary: [String: Any]){
        userName = dictionary["name"] as! String
        userId = dictionary["id"] as! String
        picture = dictionary["picture"] as! String
    }
}

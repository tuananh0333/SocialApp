//
//  ViewController.swift
//  SocialApp
//
//  Created by le tuan anh on 8/20/17.
//  Copyright © 2017 le tuan anh. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
class ViewController: UIViewController {
    var userInfo = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginWithFacebook(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn([ReadPermission.publicProfile, ReadPermission.email], viewController: self) { loginResult in
            print(loginResult)
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getUserInformation(token: accessToken)
            }
        }
    }
    
    func getUserInformation(token: AccessToken){
        let request = GraphRequest(graphPath: "me", parameters: ["fields":"email,name, picture.type(large)"], accessToken: token, httpMethod: .GET, apiVersion: FacebookCore.GraphAPIVersion.defaultVersion)
        request.start { (response, result) in
            switch result {
            case .success(let value):
                print(value.dictionaryValue)
                if let userInfomationDict = value.dictionaryValue as? [[String: AnyObject]]{
                    for infoDict in userInfomationDict{
                        let info = UserModel(with: infoDict)
                        self.userInfo.append(info)
                    }
//                    let picture = userInfomationDict["picture"]
//                    let data = picture!["data"]
//                    let url = data!["url"]
//                    print("URL Avartar:\(url)")
                }
            case .failed(let error):
                print(error)
            }
        }
    }
    
    func loginButtonClicked() {
        
//        loginManager.logIn(PublishPermission, viewController: self, completion: nil) { loginResult in
//            switch loginResult {
//            case .Failed(let error):
//                print(error)
//            case .Cancelled:
//                print("User cancelled login.")
//            case .Success(let grantedPermissions, let declinedPermissions, let accessToken):
//                print("Logged in!")
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



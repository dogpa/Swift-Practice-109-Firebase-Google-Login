//
//  LoginSuccessViewController.swift
//  Swift Practice # 109 Firebase Google Login
//
//  Created by Dogpa's MBAir M1 on 2021/11/6.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //登出按鈕
    @IBAction func tryToSignOut(_ sender: UIButton) {
        
        GIDSignIn.sharedInstance.disconnect { error in
            guard error == nil else { return }
            self.transferViewController(0)
        }
    }
    
}


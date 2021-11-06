//
//  GoogleLoginViewController.swift
//  Swift Practice # 109 Firebase Google Login
//
//  Created by Dogpa's MBAir M1 on 2021/11/6.
//

import UIKit
import Firebase
import GoogleSignIn

class GoogleLoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //在viewDidAppear判斷是否已經登入過，有的話跳轉頁面
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if GIDSignIn.sharedInstance.currentUser != nil {
            self.transferViewController(1)
        }
        
    }
    
    //方法1的方法
    @IBAction func tryToButtonLogin(_ sender: Any) {
        
        //取得clientID後指派給signInConfig
        //接著透過GIDSignIn帶入參數後跳出授權頁面執行登入
        //執行完成後跳轉頁面
        
        let signInConfig = GIDConfiguration.init(clientID: "687071961570-pf2g48vq2dapja4k55fonorq1cd5ju9i.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            if GIDSignIn.sharedInstance.currentUser != nil {
                self.transferViewController(1)
            }
        }
    }
    
    
    //方法2
    @IBAction func tryGIDSignInButtonLogin(_ sender: Any) {
        
        //透過 guard let 取得clientID
        //指派 config 取得上面的clientID
        //透過GIDSignIn嘗試授權跳出頁面協助登入
        //登入成功跳轉頁面
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if GIDSignIn.sharedInstance.currentUser != nil {
                self.transferViewController(1)
            }
        }
    }
    
    
    

}

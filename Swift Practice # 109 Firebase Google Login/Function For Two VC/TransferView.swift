//
//  TransferView.swift
//  Swift Practice # 109 Firebase Google Login
//
//  Created by Dogpa's MBAir M1 on 2021/11/6.
//

import Foundation
import UIKit

//登入頁面與使用者登入後頁面
let controllerArray = [
    "GoogleLoginViewController",
    "LoginSuccessViewController"
]


//用於指派UIStoruboard ID 後回傳使用
//用於跳轉頁面指定跳到哪一個頁面使用
func getViewControllerName (_ int:Int) -> String {
    
    return controllerArray[int]
    
}


//透過extension使用自定義Function
extension UIViewController {
    
    //跳轉頁面
    //輸入controllerArray的值後跳到對應的頁面
    func transferViewController (_ pageIndex: Int) {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: getViewControllerName(pageIndex))
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
}

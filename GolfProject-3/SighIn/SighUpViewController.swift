//
//  SighUpViewController.swift
//  GolfProject-3
//
//  Created by 桑田翔平 on 2021/04/24.
//

import UIKit
import NCMB

class SighUpViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet var userIdTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userIdTextField.delegate = self
        userPasswordTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func sighIn(){
        if (userIdTextField.text?.count)! >= 4 && (userPasswordTextField.text?.count)! > 0 {
            NCMBUser.logInWithUsername(inBackground: userIdTextField.text!, password: userPasswordTextField.text!){(user, error) in
                if error != nil {
                    self.alert()
                    print(error)
                }else{
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let rootViewController = storyboard.instantiateViewController(identifier: "RootTabBarController")
                    UIApplication.shared.keyWindow?.rootViewController = rootViewController
                    
                    let ud = UserDefaults.standard
                    ud.set(true, forKey: "isLogin")
                    ud.synchronize()
                }
            }
        }
    }
    
    func alert(){
        let alerthennsuu1 = UIAlertController(title: "パスワードが違うかユーザーIDが違います", message: "", preferredStyle: .alert)
        let alerthennsuu2 = UIAlertAction(title: "Ok", style: .default) { (action) in
            //このボタンを押したときのアクション(ここではアラートを消す処理)
            alerthennsuu1.dismiss(animated: true, completion: nil)
            self.userIdTextField.text = ""
            self.userPasswordTextField.text = ""
        }
        //アラートメインに下の押すトコを追加
        alerthennsuu1.addAction(alerthennsuu2)
        //ここでアラートの表示
        self.present(alerthennsuu1, animated: true, completion: nil)
    }
}

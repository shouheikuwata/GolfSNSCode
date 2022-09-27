//
//  SighInViewController.swift
//  GolfProject-3
//
//  Created by 桑田翔平 on 2021/04/24.
//

import UIKit
import NCMB

class SighInViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet var userIdtextfield: UITextField!
    @IBOutlet var userEmailtextfield: UITextField!
    @IBOutlet var passwordtextfield: UITextField!
    @IBOutlet var passConfirmtextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userIdtextfield.delegate = self
        userEmailtextfield.delegate = self
        passwordtextfield.delegate = self
        passConfirmtextfield.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func sighUp(){
        let user = NCMBUser()
        if (userIdtextfield.text?.count)! >= 4 && (passwordtextfield.text?.count)! > 0{
            user.userName = userIdtextfield.text!
            user.mailAddress = userEmailtextfield.text!
            
            if passwordtextfield.text == passConfirmtextfield.text {
                user.password = passwordtextfield.text!
                
                user.signUpInBackground { (error) in
                    if error != nil {
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
            }else{
                alert()
            }
        }else{
            alert2()
        }
        
    }
    
    func alert(){
        let alerthennsuu1 = UIAlertController(title: "error", message: "パスワードが一致しません", preferredStyle: .alert)
        let alerthennsuu2 = UIAlertAction(title: "Ok", style: .default) { (action) in
            //このボタンを押したときのアクション(ここではアラートを消す処理)
            alerthennsuu1.dismiss(animated: true, completion: nil)
            self.passwordtextfield.text = ""
            self.passConfirmtextfield.text = ""
        }
        //アラートメインに下の押すトコを追加
        alerthennsuu1.addAction(alerthennsuu2)
        //ここでアラートの表示
        self.present(alerthennsuu1, animated: true, completion: nil)
    }
    func alert2(){
        let alerthennsuu1 = UIAlertController(title: "error", message: "ID文字列が足りません", preferredStyle: .alert)
        let alerthennsuu2 = UIAlertAction(title: "Ok", style: .default) { (action) in
            //このボタンを押したときのアクション(ここではアラートを消す処理)
            alerthennsuu1.dismiss(animated: true, completion: nil)
            self.userIdtextfield.text = ""
        }
        //アラートメインに下の押すトコを追加
        alerthennsuu1.addAction(alerthennsuu2)
        //ここでアラートの表示
        self.present(alerthennsuu1, animated: true, completion: nil)
    }
}

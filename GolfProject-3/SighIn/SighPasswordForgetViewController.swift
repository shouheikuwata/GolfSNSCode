//
//  SighPasswordForgetViewController.swift
//  GolfProject-3
//
//  Created by 桑田翔平 on 2021/04/24.
//

import UIKit
import NCMB

class SighPasswordForgetViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet var userMailaddressTextField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        userMailaddressTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func Confirm(){
        //メールアドレスと確認して新しいパスワードをメールで送信
        NCMBUser.requestPasswordResetForEmail(inBackground: userMailaddressTextField.text!) { (error) in
            if error != nil {
                //エラー発生
                self.alert()
            }else{
                self.alert2()
            }
        }
    }
    
    func alert(){
        let alerthennsuu1 = UIAlertController(title: "error", message: "会員登録用メールの要求に失敗しました", preferredStyle: .alert)
        let alerthennsuu2 = UIAlertAction(title: "Ok", style: .default) { (action) in
            //このボタンを押したときのアクション(ここではアラートを消す処理)
            alerthennsuu1.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
        //アラートメインに下の押すトコを追加
        alerthennsuu1.addAction(alerthennsuu2)
        //ここでアラートの表示
        self.present(alerthennsuu1, animated: true, completion: nil)
    }
    func alert2(){
        let alerthennsuu1 = UIAlertController(title: "sucsess", message: "会員登録用メールの要求に成功しました", preferredStyle: .alert)
        let alerthennsuu2 = UIAlertAction(title: "Ok", style: .default) { (action) in
            //このボタンを押したときのアクション(ここではアラートを消す処理)
            alerthennsuu1.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
        //アラートメインに下の押すトコを追加
        alerthennsuu1.addAction(alerthennsuu2)
        //ここでアラートの表示
        self.present(alerthennsuu1, animated: true, completion: nil)
    }
}

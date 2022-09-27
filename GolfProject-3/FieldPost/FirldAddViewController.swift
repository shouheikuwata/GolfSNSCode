//
//  FirldAddViewController.swift
//  GolfProject-3
//
//  Created by 桑田翔平 on 2021/04/26.
//

import UIKit
import NCMB
import NYXImagesKit
import UITextView_Placeholder
import PKHUD

class FirldAddViewController: UIViewController ,UITextViewDelegate, UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet var fieldImageView:UIImageView!
    @IBOutlet var firldNameTextField:UITextField!
    @IBOutlet var firldCoseTextField:UITextField!
    @IBOutlet var firldRaundCountTextField:UITextField!
    @IBOutlet var firldCoseRateTextField:UITextField!
    @IBOutlet var firldCommentTextView:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldImageView.layer.cornerRadius = fieldImageView.bounds.width / 2.0
        fieldImageView.layer.masksToBounds = true
        TextFieldGray()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //画像をアップロードするけどサイズが大きいから小さくするコード()の中の数字でファイルサイズが決まる
        let resizedImage = selectedImage.scale(byFactor: 0.4)
        //ピッカーを閉じるコード
        picker.dismiss(animated: true, completion: nil)
        self.fieldImageView.image = resizedImage
    }
    @IBAction  func selectImage(){
        let actionController = UIAlertController(title: "画像の選択", message: "選択してください", preferredStyle: .actionSheet)
        //アラートが起動して中で押したときしたいことを書く
        let cameraAction = UIAlertAction(title: "カメラ", style: .default){(action) in
            //カメラ起動のコード
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true{
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            }else{
                print("この機種ではカメラが使えません")
            }
        }
        let alubmAction = UIAlertAction(title: "アルバムから選択", style: .default){(action) in
            //アルバム起動
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true{
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            }
        }
        let cancelAciton = UIAlertAction(title: "キャンセル", style: .default){(action) in
            self.navigationController?.popViewController(animated: true)
        }
        actionController.addAction(cameraAction)
        actionController.addAction(alubmAction)
        actionController.addAction(cancelAciton)
        self.present(actionController, animated: true, completion: nil)
    }
    func TextFieldGray(){
        //ここでフィールドのコメントの枠をわかりやすくするために囲む関数
        
        firldCommentTextView.delegate = self
        
        firldCommentTextView.layer.borderColor = UIColor.lightGray.cgColor
        // 枠の幅
        firldCommentTextView.layer.borderWidth = 1.0
        // 枠を角丸にする
        firldCommentTextView.layer.cornerRadius = 10.0
        firldCommentTextView.layer.masksToBounds = true
    }
}

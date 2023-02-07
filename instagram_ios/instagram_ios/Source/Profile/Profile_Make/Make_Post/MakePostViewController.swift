//
//  MakePostViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/06.
//

import Foundation
import UIKit
import YPImagePicker
import Alamofire
import Firebase
import FirebaseStorage

class MakePostViewController : UIViewController {
    
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var personBtn: UIButton!
    @IBOutlet weak var locationBtn: UIButton!
    
    @IBOutlet weak var firstImage : UIImageView!
    
    @IBOutlet weak var appearedImage : UIImageView!
    

    let storage = Storage.storage().reference()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NavigationBack()
        NavigationPost()
        title = "새 게시물"
        ButtonSetting()
        
        print("Make post view did load")
//        print(selectedImages)
        firstImage.image = selectedImages![0]
        

        
    }
    
    var selectedImages: [UIImage]?
    
    @IBOutlet weak var retrievedImages: UIImageView!
    
    func NavigationPost() {
        let postBtn = UIButton()
        postBtn.setTitle("공유", for: .normal)
        postBtn.setTitleColor(.systemBlue, for: .normal)
        postBtn.addTarget(self, action: #selector(onClickPosting), for: .touchUpInside)
        let barPostButton = UIBarButtonItem(customView: postBtn)
        self.navigationItem.rightBarButtonItem = barPostButton
        
    }
    
    @objc func onClickPosting() {
        print(selectedImages)

        guard let imageData = selectedImages![0].pngData() else {
            return
        }

        
        storage.child("images/file.png").putData(imageData, metadata: nil, completion: { _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
            self.storage.child("images/file.png").downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
                }
                let urlString = url.absoluteString
                print("DownLoad URL: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
            
        })
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }


    
    
    func ButtonSetting() {
        personBtn.setTitle("사람 태그하기", for: .normal)
        personBtn.setTitleColor(.black, for: .normal)
        personBtn.contentHorizontalAlignment = .left
        locationBtn.setTitle("위치 추가", for: .normal)
        locationBtn.setTitleColor(.black, for: .normal)
        locationBtn.contentHorizontalAlignment = .left
    }

}



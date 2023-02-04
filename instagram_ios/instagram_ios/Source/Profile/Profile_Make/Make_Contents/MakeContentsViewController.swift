//
//  MakeContentsViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/03.
//

import UIKit
import Foundation
import AVKit
import AVFoundation
import SafariServices
import PhotosUI
import Photos

// MARK: [import 선언 실시]
import BSImagePicker

class MakeContentsViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var myImages:[Data]! = [Data]() // 1
    var SelectedAssets = [PHAsset]() // 2
    var photoArray = [UIImage]() // 3
    var contentsLbl: String = ""
    
    
    
    var pickerController: UIImagePickerController? // 4
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textFieldText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        naviBackAndShare()
        
        
    }

//---------------------------------------------------------------------------------------------------------
    
    @IBAction func deleteImageTapped(_ sender: UIButton) {
        
        self.myImages.remove(at: sender.tag)
        self.photoArray.remove(at: sender.tag)
        self.SelectedAssets.remove(at: sender.tag)
        
        self.collectionView.reloadData()
    }

//---------------------------------------------------------------------------------------------------------
    @IBAction func addImageTapped(_ sender: Any) {
      self.openPhoto()
    }
    
    func openPhoto() {
        
    let imagePicker = ImagePickerController()
    imagePicker.settings.selection.max = 10 // 최대 선택 개수
        
    presentImagePicker(imagePicker, select: { (asset) in

    }, deselect: { (asset) in
        
    }, cancel: { (assets) in

    }, finish: { (assets) in

    for i in 0..<assets.count {
        self.SelectedAssets.append(assets[i])
    }
        self.convertAssetsToImages()
    })
 }
    
//---------------------------------------------------------------------------------------------------------
   func convertAssetsToImages() -> Void {
       
    if SelectedAssets.count != 0 {
        
        self.myImages.removeAll()
        self.photoArray.removeAll()
        
        for i in 0..<SelectedAssets.count {
            
            let manager = PHImageManager.default()
            let option = PHImageRequestOptions()
            var thumbnail = UIImage()
            option.isSynchronous = true
            manager.requestImage(for: SelectedAssets[i], targetSize: CGSize(width: 120, height: 120), contentMode: PHImageContentMode.aspectFill, options: option, resultHandler: { (result, info) -> Void in
                thumbnail = result!
            })
            
            let data = thumbnail.jpegData(compressionQuality: 0.7)
            let newImage = UIImage(data: data!)
            self.photoArray.append(newImage! as UIImage)
                // This for send images data to another view cntroller for make request
            self.myImages.append(data!)
            
            }
        
            DispatchQueue.main.async {
              self.collectionView.reloadData()
                print("reload() ON")
            }
        
        }
            
        print("complete photo array \(self.photoArray)")
    }

//---------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myImages?.count ?? 0
    }
       
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ContentsImageCollectionViewCell
        
            cell.deleteBtnCell.tag = indexPath.row
            cell.imageCell.image = self.photoArray[indexPath.row]
            cell.imageCell.layer.cornerRadius = 12
            cell.imageCell.layer.masksToBounds = true
       
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    
    //MARK: back 공유
    func naviBackAndShare() {
        title = "새 게시물"
        
        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        
        let barBackButton = UIBarButtonItem(customView: backButton)
        
        let shareButton = UIButton()
        shareButton.setTitle("공유", for: .normal)
        shareButton.setTitleColor(.systemBlue, for: .normal)
        shareButton.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        let barButtonShare = UIBarButtonItem(customView: shareButton)
        
        self.navigationItem.leftBarButtonItem = barBackButton
        self.navigationItem.rightBarButtonItem = barButtonShare
    }
    
    @objc func click() {
        print("Post Share()")
        print("\(textFieldText.text)")
        
    }
    
    
    
    
    
    
}

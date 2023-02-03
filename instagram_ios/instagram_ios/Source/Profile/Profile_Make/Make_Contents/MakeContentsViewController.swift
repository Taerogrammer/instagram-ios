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


//class MakeContentsViewController: UIViewController {
//
//
//    @IBOutlet weak var imageView: UIImageView!
//
//
//
//
//    // MARK: - [뷰 로드 실시]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        // [테스트 함수 실행 실시]
////        self.testMain()
//    }
//
//    @IBAction func buttonClicked(_ sender: AnyObject) {
//        self.testMain()
//    }
//    // MARK: - [테스트 메인 함수 정의 실시]
//    func testMain() {
//
//        /*
//         -------------------------------
//         [요약 설명]
//         -------------------------------
//         1. 필요 info plist 설정 :
//
//         Privacy - Photo Library Usage Description
//         -------------------------------
//         2. 필요 import 설정 :
//
//         import BSImagePicker
//         -------------------------------
//         3. git 라이브러리 설치 주소 :
//
//         https://github.com/mikaoj/BSImagePicker.git
//         -------------------------------
//         4. git 참고 사이트 :
//
//         https://github.com/mikaoj/BSImagePicker
//         -------------------------------
//         */
//
//
//        // [로직 처리 수행]
//        DispatchQueue.main.async {
//
//            // [앨범의 사진에 대한 접근 권한 확인 실시]
//            PHPhotoLibrary.requestAuthorization( { status in
//                switch status{
//                case .authorized:
//                    print("")
//                    print("====================================")
//                    print("상태 :: 앨범 권한 허용")
//                    print("====================================")
//                    print("")
//
//                    // [앨범 열기 수행 실시]
//                    self.openPhoto()
//                    break
//
//                case .denied:
//                    print("")
//                    print("====================================")
//                    print("상태 :: 앨범 권한 거부")
//                    print("====================================")
//                    print("")
//                    break
//
//                case .notDetermined:
//                    print("")
//                    print("====================================")
//                    print("상태 :: 앨범 권한 선택하지 않음")
//                    print("====================================")
//                    print("")
//                    break
//
//                case .restricted:
//                    print("")
//                    print("====================================")
//                    print("상태 :: 앨범 접근 불가능, 권한 변경이 불가능")
//                    print("====================================")
//                    print("")
//                    break
//
//                default:
//                    print("")
//                    print("====================================")
//                    print("상태 :: default")
//                    print("====================================")
//                    print("")
//                    break
//                }
//            })
//
//        }
//
//    }
//
//    var myImages: [Data]!
//    var SelectedAssets = [PHAsset()]
//    var photoArray = [UIImage()]
//
//
//
//    // MARK: - [앨범 열기 수행 실시]
//    func openPhoto(){
//
//        // [ImagePickerController 객체 생성 실시]
//        let imagePicker = ImagePickerController()
//        imagePicker.settings.theme.selectionStyle = .numbered // 이미지 선택 시 표시
//        imagePicker.settings.theme.backgroundColor = .darkGray // 배경 색상
//        imagePicker.albumButton.tintColor = .black // 버튼 색상
//        imagePicker.cancelButton.tintColor = .black // 버튼 색상
//        imagePicker.doneButton.tintColor = .black // 버튼 색상
//        imagePicker.settings.theme.selectionFillColor = .black // 선택 배경 색상 (Circle)
//        imagePicker.settings.theme.selectionStrokeColor = .white // 선택 표시 색상 (Circle)
//        imagePicker.settings.selection.max = 10 // 최대 선택 개수
//        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image] // 이미지 타입
//
//
//        // [화면 전환 실시]
//        self.presentImagePicker(imagePicker, select: { (asset) in
//            print("")
//            print("====================================")
//            print("[ openPhoto() :: select]")
//            print("====================================")
//            print("")
//        }, deselect: { (asset) in
//            print("")
//            print("====================================")
//            print("[openPhoto() :: deselect]")
//            print("====================================")
//            print("")
//        }, cancel: { (assets) in
//            print("")
//            print("====================================")
//            print("[openPhoto() :: cancel]")
//            print("====================================")
//            print("")
//        }, finish: { (assets) in
//            print("")
//            print("====================================")
//            print("[openPhoto() :: finish]")
//            print("선택한 이미지 개수 :: \(assets.count)")
//            print("선택한 이미지 정보 :: \(assets.description)")
//            print("====================================")
//            print("")
//
//
//            // [선택한 이미지 사이즈 변환]
//            if assets.count != 0 {
//
//                for i in 0..<assets.count {
//
//                    let imageManager = PHImageManager.default()
//                    let option = PHImageRequestOptions()
//                    option.isSynchronous = true
//                    var thumbnail = UIImage()
//
//                    imageManager.requestImage(for: assets[i],
//                                              targetSize: CGSize(width: 200, height: 200),
//                                              contentMode: .aspectFit,
//                                              options: option) { (result, info) in
//                        thumbnail = result!
//                    }
//
//                    let data = thumbnail.jpegData(compressionQuality: 0.7)
//                    let newImage = UIImage(data: data!)
//
//
//                    // [이미지 뷰에 표시 실시]
//                    self.imageView.image = newImage! as UIImage
//                }
//            }
//
//         })
//    }
//
//
//} // [클래스 종료]
//
//
//extension MakeContentsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//
//}


class MakeContentsViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var myImages:[Data]! = [Data]() // 1
    var SelectedAssets = [PHAsset]() // 2
    var photoArray = [UIImage]() // 3
    
    var pickerController: UIImagePickerController? // 4
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
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
            manager.requestImage(for: SelectedAssets[i], targetSize: CGSize(width: 200, height: 200), contentMode: PHImageContentMode.aspectFill, options: option, resultHandler: { (result, info) -> Void in
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
        return CGSize(width: 300, height: 300)
    }
    
}

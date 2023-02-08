//
//  MakeStoryViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/03.
//

import Foundation
import UIKit
import YPImagePicker

class MakeStoryViewController : UIViewController {
    
    @IBOutlet weak var Image: UIImageView!
    
    var storyImage: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        onclickStory()
    }
    
    
    func onclickStory() {
        print("onclickStory() Clicked")
        var config = YPImagePickerConfiguration()
        config.library.maxNumberOfItems = 1 // 최대 선택 가능한 사진 개수 제한
        config.library.mediaType = .photo // 미디어타입(사진, 사진/동영상, 동영상)
      
        self.storyImage = nil
        
        let picker = YPImagePicker(configuration: config)
      
        picker.didFinishPicking { [unowned picker] items, _ in
          if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
              
              self.storyImage = photo.image
          }
            
//            let main = UIStoryboard(name: "Main", bundle: nil)
//
//            guard let vc = main.instantiateViewController(withIdentifier: "MakeStoryViewController") as? MakeStoryViewController else { return }
//            picker.dismiss(animated: true, completion: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
        }
        present(picker, animated: true, completion: nil)
      }
    
    
}
extension MakeStoryViewController {
    func didSuccessPostStory(_ result: StoryResult) {
        self.presentAlert(title: "성공", message: "스토리가 업로드 되었습니다")
        
        print("didSuccessEdit() success")
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

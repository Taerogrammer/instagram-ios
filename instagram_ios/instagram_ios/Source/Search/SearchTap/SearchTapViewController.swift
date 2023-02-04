//
//  SearchTapViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/02.
//

import Foundation
import UIKit

class SearchTapViewController: UIViewController {
    
    @IBOutlet weak var buttonTop : UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var dmBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var likeLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var commentAllBtn: UIButton!
    @IBOutlet weak var postDateLbl: UILabel!

    lazy var likeText: Int = 0
    lazy var commentCount: Int = 5
    lazy var userNameText: String = "rla_xogud"
    lazy var contentText: String = "문구 200단어까지 굳이 안해도 될듯,,?"
    lazy var postDateText: String = "2022년 12월 24일"
    
    
    @IBOutlet weak var designImage: UIImageView!
    lazy var imagePassed: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designImage.image = UIImage(named: imagePassed)
        backNavigationSetting()
        
        topButton()
        bottomSetting()
        
        
        self.view.addSubview(self.thumbnailView)
        self.thumbnailView.snp.makeConstraints { make in
            make.top.equalTo(buttonTop)
            make.size.width.height.equalTo(40)
        }
        buttonTop.snp.makeConstraints { make in
            make.left.equalTo(thumbnailView.snp.right)
        }
        
    }

    func backNavigationSetting() {
        title = "탐색 탭"
        
        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barBackButton = UIBarButtonItem(customView: backButton)
        
        navigationController?.hidesBarsOnSwipe = false
        self.navigationItem.leftBarButtonItem = barBackButton
    }
    
    //MARK: 이미지 동그랗게 + 그라데이션까지?
    
//    func fetchPhoto(url: URL, completionHanlder: @escaping (UIImage?, Error?) -> Void) {
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                completionHanlder(nil, error)
//            }
//            if let data = data, let httpResponse = response as? HTTPURLResponse,
//               httpResponse.statusCode == 200 {
//                DispatchQueue.main.async {
//                    completionHanlder(UIImage(data: data), nil)
//                    let thumnail = ThumbnailView().then {
//                        $0.image = UIImage(data: data)
//                        $0.shouldShowGreenDot = true
//                    }
//                }
//            }
//            else {
//                completionHanlder(nil, error)
//            }
//        }
//        task.resume()
//    }

    //MARK: 비동기 처리 수행 해줘야함
    private let thumbnailView = ThumbnailView().then {
        var profileUrl = URL(string: "https://t1.daumcdn.net/cfile/tistory/24283C3858F778CA2E")
        var data = try? Data(contentsOf: profileUrl!)
        $0.image = UIImage(data: data!)
//      $0.shouldShowGreenDot = false
    }
    
    

    //MARK: button custom --> 이미지 url로 렌더링하기
    func topButton() {
        var userName: String = "rla_xogud"
//        var profileUrl = URL(string: "https://t1.daumcdn.net/cfile/tistory/24283C3858F778CA2E")
//        var profileImage: UIImage?
//        var renderedImage: UIImage?
        
//        DispatchQueue.global().async {
//            var data = try? Data(contentsOf: profileUrl!)
//
//            DispatchQueue.main.async {
//                profileImage = UIImage(data: data!)
//                renderedImage = profileImage?.circularImage(30)
//                self.buttonTop.setImage(renderedImage?.resizeImage(image: renderedImage!, newWidth: 60).circularImage(38), for: .normal)
//                self.buttonTop.setTitle("  \(userName)", for: .normal)
//                self.buttonTop.setTitleColor(UIColor.black, for: .normal)
//                self.buttonTop.contentHorizontalAlignment = .left
//            }
//
//        }
        self.buttonTop.setTitle(" \(userName)", for: .normal)
        self.buttonTop.contentHorizontalAlignment = .leading
        self.buttonTop.contentVerticalAlignment = .top
    }

    //MARK: buttom setting (좋아요, userName, 문구, 댓글, 날짜)
    func bottomSetting() {
        likeLbl.text = "좋아요 \(likeText)개"
        userNameLbl.text = userNameText
        contentLbl.text = contentText
        contentLbl.textAlignment = .left
        commentAllBtn.setTitle("댓글 \(commentCount)개 모두 보기", for: .normal)
        commentAllBtn.contentHorizontalAlignment = .left
        postDateLbl.text = postDateText
    }
    
    
}

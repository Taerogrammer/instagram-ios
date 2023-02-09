//
//  CommentViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/02.
//

import Foundation
import UIKit
import Alamofire

class CommentViewController : UIViewController {
    
    @IBOutlet weak var userNameBtn : UIButton!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var commentCollectionView: UICollectionView!
    @IBOutlet weak var myProfileImg: UIImageView!
    
    
    var getUserInfo: SearchTapResult?
    
    var comments: [CommentResult] = []
    
    let singleton = EditSingleton.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackAndDM()
        contentField()
        print("왔나? >> \(getUserInfo)")
        
        profileImg.load(url: URL(string: getUserInfo?.userProfileUrl ?? "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!)
        contentLbl.text = getUserInfo?.content ?? ""
        userNameBtn.setTitle("\(getUserInfo!.userName)", for: .normal)
        userNameBtn.titleLabel?.font = .NotoSans(.bold, size: 16)
        userNameBtn.contentHorizontalAlignment = .left
        commentCollectionView.layer.addBorder([.top, .bottom], color: .black, width: 0.5)
        myProfileImg.load(url: URL(string: "\(singleton.profileUrl!)" ?? "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!)
        
        commentCollectionView.dataSource = self
        commentCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.getComments()
        }
    }
    
    
    
    func BackAndDM() {
        title = "댓글"
        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barBackButton = UIBarButtonItem(customView: backButton)
        
        let dmImage = UIImage(named: "home_dm")!
        let dmButton = UIButton(frame: CGRect(x: 0, y: 0, width: dmImage.size.width, height: dmImage.size.height))
        dmButton.setImage(dmImage, for: .normal)
        dmButton.addTarget(self, action: #selector(onClickDm), for: .touchUpInside)
        
        let barDmButton = UIBarButtonItem(customView: dmButton)
        
        self.navigationItem.leftBarButtonItem = barBackButton
        self.navigationItem.rightBarButtonItem = barDmButton
    }
    
    @objc func onClickDm() {
        print("DM clicked")
    }
    
    //MARK: 게시글 내용
    func contentField() {
        contentLbl.text = "크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크"
        contentLbl.numberOfLines = 0
        let newSize = contentLbl.sizeThatFits(CGSize(width: view.frame.width, height: CGFloat.greatestFiniteMagnitude))
        userNameBtn.setTitle("userName 이름!", for: .normal)
        userNameBtn.setTitleColor(.black, for: .normal)
        userNameBtn.addTarget(self, action: #selector(onClickProfile), for: .touchUpInside)
        
        
    }
    
    func getComments() {
        AF.request("\(Constant.Olive_URL)/app/posts/\(getUserInfo!.postId)/comments",method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: CommentResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("성공한듯,, \(response)")
                DispatchQueue.main.async {
                    self.comments = response.result
                    self.commentCollectionView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    @objc func onClickProfile() {
        let otherProfileVC = storyboard?.instantiateViewController(withIdentifier: "OtherProfileViewController") as! OtherProfileViewController
        self.navigationController?.pushViewController(otherProfileVC, animated: true)
        
    }
    
    
    
}


extension CommentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commentCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CommentCollectionViewCell
        cell.userProfile.load(url: URL(string: "\(comments[indexPath.row].profileUrl)" ?? "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!)
        cell.userName.text = comments[indexPath.row].username
        cell.userName.font = .NotoSans(.bold, size: 16)
        cell.contents.text = comments[indexPath.row].content
        cell.likeAndRecomment.text = "좋아요     답글 달기"
        cell.likeAndRecomment.textColor = .gray
        
        
        return cell
        
    }

}

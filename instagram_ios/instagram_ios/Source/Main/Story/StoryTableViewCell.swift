//
//  StoryTableViewCell.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/03.
//

import UIKit

class StoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    
    static let identifier = "StoryTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StoryTableViewCell", bundle: nil)
    }
    
    func configure(with stories: [Story]) {
        self.stories = stories
        StoryCollectionView.reloadData()
    }
    
    @IBOutlet weak var StoryCollectionView: UICollectionView!
    var stories = [Story]()

    override func awakeFromNib() {
        super.awakeFromNib()
        StoryCollectionView.register(StoryCollectionViewCell.nib(), forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        StoryCollectionView.delegate = self
        StoryCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = StoryCollectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as! StoryCollectionViewCell
        cell.configure(with: stories[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0:
//            print("11111")
//        case 1:
//            print("2222")
//        case 2:
//            print("33333")
//        default:
//            print("그 외의 것")
//        }
        print(indexPath.row)
        
        
        //MARK: 스토리 클릭 시 화면 전달 구현 예정
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let storyVC = storyboard.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
        
        
        
        
    }
    
}

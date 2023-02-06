//
//  PostContent.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/06.
//

import UIKit

class PostContent{
    static let shared = PostContent()
    
    //var count: Int {self.StoryList.count}
    var contentImages: [UIImage] = []
    var contentUrls: [String] = []
    var content: String = ""
    var contentData: Content = Content(content: "", imgUrls: [""])
    
    public func setContentImage(result: UIImage){
        self.contentImages.append(result)
    }
    public func getContentImage() -> UIImage{
        return self.contentImages[0]
    }
    public func setContentUrl(result: String){
        self.contentUrls.append(result)
        print(contentUrls)
    }
    public func setContent(content: String){
        self.content = content
    }
    public func setContentData(result: [String]){
        //contentUrls = result
        contentData = Content(content: self.content, imgUrls: result)
        print(contentData)
    }
    public func getContentData() -> Content{
        contentData = Content(content: self.content, imgUrls: self.contentUrls)
        return contentData
    }
}

struct Content{
    var content: String
    var imgUrls: [String]
}

//
//  CommentResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/10.
//

struct CommentResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [CommentResult]
}

struct CommentResult: Codable {
    var profileUrl: String
    var username: String
    var content: String?
    var recommentNum: Int
    var likeNum: Int
    var updatedAt: String
}

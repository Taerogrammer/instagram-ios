//
//  GettingStoryResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/10.
//

struct GettingStoryResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: GettingStoryResult?
}

struct GettingStoryResult: Codable {
    var profileUrl: String?
    var username: String
    var mediaUrl: String
    var postId: Int?
    var updatedAt: String?
}

//
//  SearchTapResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/09.
//

struct SearchTapResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: SearchTapResult?
}

struct SearchTapResult: Codable {
    var postId: Int
    var userName: String
    var content: String?
    var imgUrls: [String]
    var likeCount: Int
    var postUserId: Int
    var likeState: Int
    var userProfileUrl: String?
    var dayDetailDto: DayResult?
}
struct DayResult: Codable {
    var day: String
}

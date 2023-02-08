//
//  HomeUserResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/08.
//

struct HomeUserResponse : Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [HomeUserResult]
}

struct HomeUserResult: Codable {
    var postId: Int
    var userName: String
    var content: String?
    var imgUrls: [String]
    var likeCount: Int
    var commentCount: Int
    var postUserId: Int
    var likeState: Int
    var userProfileUrl: String?
    var dayInfo: UserDayInfo?
}

struct UserDayInfo: Codable {
    var month: Int
    var day: Int
}



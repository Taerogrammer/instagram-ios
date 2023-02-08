//
//  FollowerResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/08.
//

struct FollowerResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [FollowerResult]
}

struct FollowerResult: Codable {
    var userId: Int
    var name: String?
    var userName: String?
    var profileImageUrl: String?
    var followState: Int
    var equalUserState: Int
}

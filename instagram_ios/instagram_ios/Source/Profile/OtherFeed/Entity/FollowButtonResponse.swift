//
//  FollowButtonResponse.swift
//  instagram_ios
//
//  Created by κΉνν on 2023/02/09.
//

struct FollowButtonResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: FollowButtonResult?
}

struct FollowButtonResult: Codable {
    var fromUserId: Int
    var toUserId: Int
}

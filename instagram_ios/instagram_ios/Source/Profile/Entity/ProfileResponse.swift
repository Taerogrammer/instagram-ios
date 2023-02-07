//
//  ProfileResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/04.
//

struct ProfileResponse : Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: ProfileResult?
}

struct ProfileResult: Codable {
    var pageOwnerState: Bool
    var postCount: Int
    var followState: Bool
    var follower: Int
    var following: Int
    var profileUserDto: UserInfo?
    var thumbnailUrls: Array<String>
}

struct UserInfo: Codable {
    var username: String?
    var name: String?
    var bio: String?
    var profileUrl: String?
    var link: String?
}

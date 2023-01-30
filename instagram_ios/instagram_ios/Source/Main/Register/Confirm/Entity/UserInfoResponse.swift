//
//  UserInfoResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

struct UserInfoResponse : Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: RegisterResult?
}

struct RegisterResult: Codable {
    var jwt : String
    var userIdx : Int
}

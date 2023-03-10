//
//  LoginResponse.swift
//  instagram_ios
//
//  Created by κΉνν on 2023/01/31.
//

struct LoginResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoginResult?
}

struct LoginResult: Decodable {
    var jwt: String
    var userIdx: Int
}


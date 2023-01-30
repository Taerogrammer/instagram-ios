//
//  FacebookResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//


struct FacebookResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: FacebookResult?
}

struct FacebookResult: Decodable {
    var jwt: String
    var userIdx: Int
}

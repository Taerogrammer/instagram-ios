//
//  LikeResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/09.
//

struct LikeResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String
}

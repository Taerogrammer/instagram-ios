//
//  CommentCountResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/10.
//

struct CommentCountResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: Int
}

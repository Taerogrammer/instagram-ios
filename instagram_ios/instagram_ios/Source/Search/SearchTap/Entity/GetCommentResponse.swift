//
//  GetCommentResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/10.
//

struct GetCommentResponse: Codable {
    var isSuccess: Bool
    var message: String
    var result: Int
}

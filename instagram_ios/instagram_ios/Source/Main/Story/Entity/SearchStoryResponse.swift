//
//  SearchStoryResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/09.
//

struct SearchStoryResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message:String
    var result: [SearchStoryResult]
}

struct SearchStoryResult: Codable {
    var profileUrl: String
    var userName: String 
}

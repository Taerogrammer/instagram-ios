//
//  StoryResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/08.
//

struct StoryResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: StoryResult?
}

struct StoryResult: Codable {
    var userId: Int
    var storyId: Int
}

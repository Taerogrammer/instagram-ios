//
//  EditResponse.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

struct EditResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: EditResult?
}

struct EditResult: Decodable {
    var name: String?
    var userName: String
    var bio: String?
    var link: String?
    var profileUrl: String?
}

//
//  PrivateEmailResponse.swift
//  instagram_ios
//
//  Created by κΉνν on 2023/02/08.
//

struct PrivateEmailResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String
}

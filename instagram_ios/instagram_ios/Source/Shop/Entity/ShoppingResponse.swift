//
//  ShopResponse.swift
//  instagram_ios
//
//  Created by κΉνν on 2023/02/09.
//

struct ShoppingResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ShoppingResult]
    
}

struct ShoppingResult: Codable {
    var id: Int
    var imgUrl: String
    
}

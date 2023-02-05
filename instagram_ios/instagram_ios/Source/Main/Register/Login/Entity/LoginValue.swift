//
//  LoginJWT.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/05.
//

struct LoginSingleton {
    static let shared = LoginSingleton()
    var jwt: String?
    var userIdx: Int?
    
    private init() {}
}


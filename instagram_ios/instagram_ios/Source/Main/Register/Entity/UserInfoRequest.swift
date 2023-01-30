//
//  UserInfoRequest.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

struct UserInfoRequest {

}



class UserInfoSingleton {
    static let shared = UserInfoSingleton()
    
    var name: String?
    var password: String?
    var phone: String?
    var email: String?
    var userName: String?
    
    private init () {}
}

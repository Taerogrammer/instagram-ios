//
//  PrivateSingleton.swift
//  instagram_ios
//
//  Created by κΉνν on 2023/02/08.
//

class PrivateSingleton {
    static let shared = PrivateSingleton()
 
    var email: String?
    var phone: String?
    var gender: String?
    var birthday: String?
    
    private init() { }
}

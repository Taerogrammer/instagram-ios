//
//  EditSingleton.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

struct EditSingleton {
    static let shared = EditSingleton()
    
    var name: String?
    var userName: String?
    var pronouns: String?
    var links: String?
    var profileUrl: String?
    
    private init() {}
}

//
//  EditSingleton.swift
//  instagram_ios
//
//  Created by κΉνν on 2023/02/01.
//

class EditSingleton {
    static let shared = EditSingleton()
    
    var name: String?
    var userName: String?
    var bio: String?
    var link: String?
    var profileUrl: String?
    
    private init() {}
}

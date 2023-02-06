//
//  EditDataManager.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/05.
//

import Alamofire

class EditDataManager {
    func patchEdit(_ parameter: EditRequest, delegate: EditViewController) {
        AF.request("\(Constant.Base_URL)/app/users/\(UserDefaults.standard.integer(forKey: "userIdx"))", method: .patch, parameters: parameter, encoder: JSONParameterEncoder(), headers: ["X-ACCESS-TOKEN" : "Header값 넣기"]).validate().responseDecodable(of: EditResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess, let result = response.result {
                    delegate.didSuccessEdit(result)
                }
                else {
                    switch response.code {
                    case 2021: delegate.failedToRequest(message: "유저 네임은 빈값이 될 수 없습니다.")
                    case 2003: delegate.failedToRequest(message: "권한이 없는 유저의 접근입니다.")
                    case 2001: delegate.failedToRequest(message: "JWT를 입력해주세요.")
                    
                    default: delegate.failedToRequest(message: "이외의 다른 오류입니다.")
                    }
                }
            case .failure(let error):
                print(error)
                delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다.")
            }
        }
    }
}

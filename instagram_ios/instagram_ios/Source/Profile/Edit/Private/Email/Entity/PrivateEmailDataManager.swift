//
//  PrivateEmailDataManager.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/08.
//

import Alamofire

class PrivateEmailDataManager {
    func patchEmail(_ parameter: PrivateEmailRequest, delegate: PrivateEmailViewController) {
        AF.request("\(Constant.Base_URL)/app/users/\(UserDefaults.standard.integer(forKey: "userIdx"))/email", method: .patch, parameters: parameter, encoder: JSONParameterEncoder(), headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: PrivateEmailResponse.self) { response in
            print("URL >> \(Constant.Base_URL)/app/users/\(UserDefaults.standard.integer(forKey: "userIdx"))/email")
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessEdit()
                }
                else {
                    switch response.code {
                    case 2034: delegate.failedToRequest(message: "수정 권한이 없습니다.")
                    case 2035: delegate.failedToRequest(message: "이메일 형식을 확인해주세요.")
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

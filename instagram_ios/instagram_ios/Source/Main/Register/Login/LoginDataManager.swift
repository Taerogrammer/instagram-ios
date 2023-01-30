//
//  LoginDataManager.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Alamofire

class LoginDataManager {
    func postLogin(_ parameter: LoginRequest, delegate: LoginViewController) {
        AF.request("zz", method: .post, parameters: parameter, encoder: JSONParameterEncoder(), headers: nil).validate().responseDecodable(of: LoginResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess, let result = response.result {
                    delegate.didSuccessLogin(result)
                }
                else {
                    switch response.code {
                        case 2000: delegate.failedToRequest(message: "request 오류 등")
                        
                    default: delegate.failedToRequest(message: "나중에 하기")
                    }
                }
            case .failure(let error):
                print(error)
                delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
            }
        }
    }
}

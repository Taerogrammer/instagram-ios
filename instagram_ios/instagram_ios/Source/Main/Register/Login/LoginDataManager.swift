//
//  LoginDataManager.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Alamofire

class LoginDataManager {
    func postLogin(_ parameter: LoginRequest, delegate: LoginViewController) {
        AF.request("\(Constant.Base_URL)/app/users/login", method: .post, parameters: parameter, encoder: JSONParameterEncoder(), headers: nil).validate().responseDecodable(of: LoginResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess, let result = response.result {
                    delegate.didSuccessLogin(result)
                }
                else {
                    switch response.code {
                    case 3014:
                        delegate.failedToRequest(message: "없는 아이디거나 비밀번호가 틀렸습니다.")
                    default: delegate.failedToRequest(message: "이외의 다른 오류입니다.")
                    }
                }
            case .failure(let error):
                print(error)
                delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
            }
        }
    }
}

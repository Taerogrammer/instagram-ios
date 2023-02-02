//
//  ConfirmDataManager.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Foundation
import Alamofire

class ConfirmDataManager {
    func postRegister(_ parameter: UserInfoRequest, delegate: ConfirmViewController) {
        AF.request("\(Constant.Base_URL)/app/users", method: .post, parameters: parameter, encoder: JSONParameterEncoder(), headers: nil).validate().responseDecodable(of: UserInfoResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess, let result = response.result {
                    delegate.didSuccessRegister(result)
                }
                else {
                    switch response.code {
                    case 2010: delegate.failedToRequest(message: "유저 아이디 값을 확인해주세요.")
                    case 2015: delegate.failedToRequest(message: "이메일을 입력해주세요.")
                    case 2016: delegate.failedToRequest(message: "이메일 형식을 확인해주세요.")
                    case 2017: delegate.failedToRequest(message: "중복된 이메일입니다.")
                    case 2018: delegate.failedToRequest(message: "이메일 또는 전화번호를 입력해주세요")
                    case 2019: delegate.failedToRequest(message: "중복된 전화번호입니다.")
                    case 2020: delegate.failedToRequest(message: "이미 존재하는 유저 네임입니다.")
                    case 4011: delegate.failedToRequest(message: "비밀번호 암호화에 실패하였습니다.")
                    default: delegate.failedToRequest(message: "이외의 다른 오류입니다")
                    }
                }
            case .failure(let error):
                print(error)
                delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                
            }
        }
    }
    
}

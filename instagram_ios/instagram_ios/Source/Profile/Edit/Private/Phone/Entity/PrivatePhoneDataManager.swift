//
//  PrivatePhoneDataManager.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/08.
//

import Alamofire

class PrivatePhoneDataManager {
    func patchPhone(_ parameter: PrivatePhoneRequest, delegate: PrivatePhoneViewController) {
        AF.request("\(Constant.Base_URL)/app/users/\(UserDefaults.standard.integer(forKey: "userIdx"))/phone", method: .patch, parameters: parameter, encoder: JSONParameterEncoder(), headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: PrivatePhoneResponse.self) { response in
            switch response.result {
            case . success(let response):
                if response.isSuccess {
                    delegate.didSuccessEdit()
                }
                else {
                    switch response.code {
                    case 2034: delegate.failedToRequest(message: "수정 권한이 없습니다.")
                    case 2036: delegate.failedToRequest(message: "전화번호 형식을 확인해주세요.")
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

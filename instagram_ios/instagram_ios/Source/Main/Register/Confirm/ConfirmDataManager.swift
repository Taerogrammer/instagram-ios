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
        AF.request("zz", method: .post, parameters: parameter, encoder: JSONParameterEncoder(), headers: nil).validate().responseDecodable(of: UserInfoResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess, let result = response.result {
                    delegate.didSuccessRegister(result)
                }
                else {
                    switch response.code {
                    case 2000: delegate.failedToRequest(message: "request 오류입니다")
                    case 3000: delegate.failedToRequest(message: "뭐지")
                        
                    default: delegate.failedToRequest(message: "일단 그냥 오류")
                    }
                }
            case .failure(let error):
                print(error)
                delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                
            }
        }
    }
    
}

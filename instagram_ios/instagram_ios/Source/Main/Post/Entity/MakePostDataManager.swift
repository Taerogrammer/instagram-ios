//
//  MakePostDataManager.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/09.
//

import Foundation
import Alamofire


class MakePostDataManager {
    func postRegister(_ parameter: MakePostRequest, delegate: MakePostViewController) {
        AF.request("\(Constant.Base_URL)/app/feeds", method: .post, parameters: parameter, encoder: JSONParameterEncoder(), headers:["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: MakePostResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess{
                    delegate.didSuccessPost()
                }
                else {
                    switch response.code {
                    case 2000: delegate.failedToRequest(message: "입력 값을 확인해주세요.")
                    case 2001: delegate.failedToRequest(message: "JWT를 입력해주세요.")
                    case 2002: delegate.failedToRequest(message: "유효하지 않은 JWT입니다.")
                    case 2003: delegate.failedToRequest(message: "권한이 없는 유저의 접근입니다.")
                    case 2030: delegate.failedToRequest(message: "파일을 입력해주세요.")
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

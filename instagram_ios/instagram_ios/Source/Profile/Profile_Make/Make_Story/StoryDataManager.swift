//
//  StoryDataManager.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/08.
//

import Alamofire

class StoryDataManager {
    func postStory(_ parameter: StoryRequest, delegate: MakeStoryViewController) {
        AF.request("\(Constant.Olive_URL)/app/stories", method: .post, parameters: parameter, encoder: JSONParameterEncoder(), headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: StoryResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess, let result = response.result {
                    delegate.didSuccessPostStory(result)
                }
                else {
                    switch response.code {
                    case 2000: delegate.failedToRequest(message: "올바르지 않은 소스 ulr 형식입니다.")
                    case 2001: delegate.failedToRequest(message: "올바르지 않은 미디어 타입 형식입니다.")
                    case 3000: delegate.failedToRequest(message: "접근 권한이 없는 유저입니다.")
                    case 3001: delegate.failedToRequest(message: "접근할 수 없는 미디어입니다.")
                    case 4000: delegate.failedToRequest(message: "DB오류")
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

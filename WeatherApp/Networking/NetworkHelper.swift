//
//  NetworkHelper.swift
//  AvazBa
//
//  Created by Valentin Šarić on 17/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class NetworkHelper{
    static func getDataFromApi<T: Codable>(with endpoint: Endpoint) -> Observable<T>{
        return Observable.deferred({
            return Observable.create{ observer -> Disposable in
                if let link = endpoint.url{
                    let request = Alamofire.request(link)
                        .validate()
                        .responseJSON{response in
                            guard let data = response.data else{
                                observer.onError(response.error!)
                                return
                            }
                            do{
                                let responseWithType = try JSONDecoder().decode(T.self, from: data)
                                observer.onNext(responseWithType)
                            }catch{
                                observer.onError(response.error!)
                                return
                            }
                    }
                    return Disposables.create{
                        request.cancel()
                    }
                }else{
                    return Disposables.create()
                }
            }
        })
    }
}

//
//  BaseRepository.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation


import Foundation
import RxSwift

class BaseRepository {
//    let networkHelper = Networking()
    let networkHelperRX = NetworkingRX()
    let disposableBag = DisposeBag()
    
    
    
    func makeNetworkPostRequestRx<T:Codable>(endPoint:ApiService,response:T.Type,successCondition:@escaping (T) -> Bool,errorMessage:@escaping (T)->String,successAction:((T) -> ())? = nil ) -> Observable<NetworkResult<T>> {
        
        return Observable.create{ [weak self] observer in
            
            let requestObserver =    self?.networkHelperRX.performPostRequest(endpoint: endPoint, returnType: T.self).subscribe(onNext: { response in
                if case let .success(data) = response{
                    if(successCondition(data)){
                        DispatchQueue.main.async {
                            observer.onNext(.success(data))
                            successAction?(data)
                        }
                    } else{
                        observer.onNext(.failure(errorMessage(data),data))
                    }} else if case let .error(error) = response {
                    observer.onNext(.error(error))
                }
                
            })
            return Disposables.create {
                requestObserver?.dispose()
            }
            
        }
        
        
    }
    
    
    func makeNetworkPostRequest<R:Any,T:Codable>(endPoint:ApiService,request: R,response:T.Type,successCondition:@escaping (T) -> Bool,errorMessage:@escaping (T)->String,successAction:((T) -> ())? = nil ) -> Observable<NetworkResult<T>> {
        
        return Observable.create{ [weak self] observer in
            
            let requestObserver =    self?.networkHelperRX.performPostRequest2(endpoint: endPoint, returnType: T.self, request: request).subscribe(onNext: { response in
                if case let .success(data) = response{
                    if(successCondition(data)){
                        DispatchQueue.main.async {
                            observer.onNext(.success(data))
                            successAction?(data)
                        }
                    } else{
                        observer.onNext(.failure(errorMessage(data),data))
                    }} else if case let .error(error) = response {
                    observer.onNext(.error(error))
                }
                
            })
            return Disposables.create {
                requestObserver?.dispose()
            }
            
        }
        
        
    }
    
   
    
}


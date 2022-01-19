//
//  NetworkingRX.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation


import RxSwift

enum NetworkResult<T>{
    case success(T)
    case failure(String,T?)
    case error(Error?)
    case other(T)
}
 
struct NetworkingRX {
    
    func performNetworkTask<R:Codable,T: Codable>(endpoint: EndpointType,
                                                  returnType: T.Type,
                                                  request:R
    ) -> Observable<NetworkResult<T>>
    {
        
        return Observable.create{ observer in
            
            let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
            guard let urlRequest = URL(string: urlString ?? "") else {
                return Disposables.create {
                    observer.onError(MyError(msg: "Invalid URL"))
                } }
            var endpointRequest = URLRequest(url: urlRequest)
            endpointRequest.httpMethod = "POST"
            endpointRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
         //   endpointRequest.addValue(LocalStorage.sharedInstance.get(for: .authorization) ?? "", forHTTPHeaderField: "Authorization")
            print("✅ Request: \(urlString ?? "") \n \(request)\n")
            
            do {
                let apiRequest = try JSONEncoder().encode(request)
                endpointRequest.httpBody = apiRequest
            } catch {
                print("❌  Error Encoding JSON: \(urlString ?? "") \n\(error.localizedDescription)")
                return Disposables.create {
                    observer.onNext(.error(error))
                }
            }
            
            let urlSession = URLSession.shared.dataTask(with: endpointRequest) { (data, urlResponse, error) in
                if let _ = error {
                    print("❌  Error :\(urlString ?? "") \n\(error?.localizedDescription ?? "Bad request")")
                    observer.onNext(.error(error))
                    return
                }
                guard let data = data else {
                    print("❌  Error :\(urlString ?? "") ")
                    observer.onNext(.error(nil))
                    return
                }
                let response = Response(data: data)
                
                guard let decoded = response.decode(returnType) else {
                    print("❌  Error Decoding Response : \(urlString ?? "")")
                    print(response.decode(returnType) as Any)

                    observer.onNext(.error(nil))
                    return
                }
                print("✅  Response: \(urlString ?? "") \n \(decoded)\n")
                observer.onNext(.success(decoded))
                
            }
            urlSession.resume()
            observer.onCompleted()
            return Disposables.create {
                 urlSession.cancel()
            }
        }
    }
    
    func performPostRequest<T: Codable>(endpoint: EndpointType,
                                                  returnType: T.Type
    ) -> Observable<NetworkResult<T>>
    {
        
        return Observable.create{ observer in
                
           let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
                guard let urlRequest = URL(string: urlString ?? "") else { return Disposables.create {
                    observer.onError(MyError(msg: "Invalid URL"))
                } }
                var endpointRequest = URLRequest(url: urlRequest)
                endpointRequest.httpMethod = "GET"
                endpointRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

                do {
                   
                } catch {
                    print("❌ Error Encoding JSON: \(urlString ?? "") \n\(error.localizedDescription)")
                   return Disposables.create {
                                     observer.onNext(.error(error))
                                 }
                }
                
                let urlSession = URLSession.shared.dataTask(with: endpointRequest) { (data, urlResponse, error) in
                    if let _ = error {
                        print("❌  Error :\(urlString ?? "") \n\(error?.localizedDescription ?? "Bad request")")
                        observer.onNext(.error(error))
                        return
                    }
                    guard let data = data else {
                        print("❌  Error :\(urlString ?? "") ")
                        observer.onNext(.error(nil))
                        return
                    }
                    let response = Response(data: data)
                    guard let decoded = response.decode(returnType) else {
                        print(error ?? "")
                        print("❌  Error Decoding Response : \(urlString ?? "")")
                        print(response.decode(returnType) as Any)

                        observer.onNext(.error(nil))
                        return
                    }
                    print("✅  Response: \(urlString ?? "") \n \(decoded)\n")
                    observer.onNext(.success(decoded))
                }
                urlSession.resume()
                return Disposables.create {
                     urlSession.cancel()
                }
        }
}
    
    func performPostRequest2<R:Any,T: Codable>(endpoint: EndpointType,
                                                      returnType: T.Type,
                                                      request:R) -> Observable<NetworkResult<T>>
        {
            
            return Observable.create{ observer in
                let newURL = "\( endpoint.baseURL)\(request)\((endpoint.path))"
                
            //   let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
                    guard let urlRequest = URL(string: newURL ?? "") else { return Disposables.create {
                        observer.onError(MyError(msg: "Invalid URL"))
                    } }
                    var endpointRequest = URLRequest(url: urlRequest)
                    endpointRequest.httpMethod = "GET"
                    endpointRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    print("✅  Request: \(newURL ?? "") \n \(request)\n")
                    do {
                       
                    } catch {
                        print("❌ Error Encoding JSON: \(newURL ?? "") \n\(error.localizedDescription)")
                       return Disposables.create {
                                         observer.onNext(.error(error))
                                     }
                    }
                    
                    let urlSession = URLSession.shared.dataTask(with: endpointRequest) { (data, urlResponse, error) in
                        if let _ = error {
                            print("❌  Error :\(newURL ?? "") \n\(error?.localizedDescription ?? "Bad request")")
                            observer.onNext(.error(error))
                            return
                        }
                        guard let data = data else {
                            print("❌  Error :\(newURL ?? "") ")
                            observer.onNext(.error(nil))
                            return
                        }
                        let response = Response(data: data)
                        guard let decoded = response.decode(returnType) else {
                            print("❌  Error Decoding Response : \(newURL ?? "")")
                            print(response.decode(returnType) as Any)
                            
                            observer.onNext(.error(nil))
                            return
                        }
                        print("✅  Response: \(newURL ?? "") \n \(decoded)\n")
                        observer.onNext(.success(decoded))
                    }
                    urlSession.resume()
                    return Disposables.create {
                         urlSession.cancel()
                    }
            }
    }
}

public struct MyError: Error {
    let msg: String
    
}

extension MyError: LocalizedError {
    public var errorDescription: String? {
        return NSLocalizedString(msg, comment: "")
    }
}

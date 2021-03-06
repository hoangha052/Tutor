//
//  NetworkProvider.swift
//  Bartr
//
//  Created by Thuy Luong on 5/22/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import Alamofire
//import RxSwift

class NetworkProvider {
//    
//    func get(_ urlString: String , params: [String : AnyObject]?) -> Observable<AnyObject?> {
//        return requestWithMethod(method: .get, urlString: urlString, params: params)
//    }
//    
//    func getMethodWithParams(_ urlString: String , params: [String : AnyObject]?) -> Observable<AnyObject?> {
//        return requestWithMethodParams(.get, urlString: urlString, params: params)
//    }
//    
//    func requestWithMethodParams(_ method: HTTPMethod, urlString: String, params: [String : AnyObject]?) -> Observable<AnyObject?> {
//        return Observable<AnyObject?>.create { observer -> Disposable in
//
//          let request =  Alamofire.request(urlString, method: method, parameters: params)
//            request.responseJSON(completionHandler: { response in
//                switch response.result {
//                case .success(let response):
//                    observer.onNext(response as AnyObject?)
//                    observer.onCompleted()
//                case .failure(let error):
//                    debugPrint("Error \(error)")
//                    observer.onError(error)
//                }
//            })
//            return Disposables.create() {
//                request.cancel()
//            }
//        }
//        
//    }
//    
//    
//    func post(_ urlString: String , params: [String : AnyObject]?) -> Observable<AnyObject?> {
//        return requestWithMethod(method: .post, urlString: urlString, params: params)
//    }
//    
//    func put(_ urlString: String , params: [String : AnyObject]? ) -> Observable<AnyObject?> {
//        return requestWithMethod(method: .put, urlString: urlString, params: params)
//    }
//    
//    func delete(_ urlString: String , params: [String : AnyObject]?) -> Observable<AnyObject?> {
//        return requestWithMethod(method: .delete, urlString: urlString, params: params)
//    }
//    
//    func requestWithMethod(method methodRequest: HTTPMethod, urlString: String, params: [String : AnyObject]? , bodyParams: AnyObject? = nil) -> Observable<AnyObject?> {
//        return Observable<AnyObject?>.create { observer -> Disposable in
//
//            let request = Alamofire.request(urlString, method: methodRequest, parameters: params, encoding: JSONEncoding.default, headers: nil)
//            request.responseJSON(completionHandler: { response in
//                switch response.result {
//                case .success(let response):
//                    observer.onNext(response as AnyObject?)
//                    observer.onCompleted()
//                case .failure(let error):
//                    debugPrint("Error \(error)")
//                    observer.onError(error)
//                }
//            })
//            
//            return Disposables.create() {
//                request.cancel()
//            }
//        }
//    }
//    
////    func postDataWithMultipart(urlString: String, imageData:[AnyObject], params:[String: AnyObject]?) -> Observable<AnyObject?> {
//    func postDataWithMultipart(_ urlString: String, imageData:[UIImage?], params:[String: AnyObject]?) -> Observable<AnyObject?> {
//        return Observable<AnyObject?>.create{ observer in
//            
//            let _ = Alamofire.upload(multipartFormData: {
//                multipartFormData in
//                var name = 12
//                for itemImage in imageData {
//                    name += 1
//                    let fileImage = "name \(name).jpg"
//                    if let image = itemImage {
//                        if let imageData = UIImageJPEGRepresentation(image, 0.5) {
//                            multipartFormData.append(imageData, withName: "Photo", fileName: fileImage, mimeType: "image/jpg")
//                        }
//                    }
//                }
//                
//                for (key, value) in params! {
//                    if value is String {
//                        if let StringValue = value as? String {
//                            multipartFormData.append(StringValue.data(using: String.Encoding.utf8)!, withName: key)
//                        }
//                    } else if let IntValue = value as? Int {
//                        multipartFormData.append("\(IntValue)".data(using: String.Encoding.utf8)!, withName: key)
//                    }  else if let doubleValue = value as? Double {
//                        multipartFormData.append("\(doubleValue)".data(using: String.Encoding.utf8)!, withName: key)
//                    } else if value is NSArray {
//                        do {
//                            let bodyData =  try JSONSerialization.data(withJSONObject: value, options: [])
//                            let body = String(data: bodyData, encoding: String.Encoding.utf8)!
//                             multipartFormData.append(body.data(using: String.Encoding.utf8)!, withName: key)
//                        }
//                        catch {
//                            
//                        }
//                    } else if value is Dictionary<String, Any> {
//                        print("valueData")
//                        print(value)
//                        do {
//                            let bodyData =  try JSONSerialization.data(withJSONObject: value, options:  .prettyPrinted)
////                            let body = String(data: bodyData, encoding: String.Encoding.utf8)!
//                            multipartFormData.append(bodyData, withName: key)
//                        }
//                        catch {
//                            
//                        }
//                    } //if value is NSArray || value is Location
//                }
//                
//            }, to: urlString, encodingCompletion: {
//                encodingResult in
//                switch encodingResult {
//                case .success(let upload, _, _):
//                    upload.responseJSON { response in
//                        switch response.result {
//                        case .success(let response):
//                            observer.onNext(response as AnyObject?)
//                            observer.onCompleted()
//                        case .failure(let error):
//                            debugPrint("Error \(error)")
//                            observer.onError(error)
//                        }
//                    }
//                    
//                case .failure(let encodingError):
//                    print(encodingError)
//                    observer.onError(encodingError)
//                }
//            })
//            
//            return Disposables.create() {
//            }
//
//        }
//    }
    
}


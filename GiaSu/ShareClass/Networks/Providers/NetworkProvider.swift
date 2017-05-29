//
//  NetworkProvider.swift
//  Bartr
//
//  Created by Thuy Luong on 5/22/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
//import RxSwift

class NetworkProvider {
    
    func get(_ urlString: String , params: [String : AnyObject]?, completionHandler: @escaping(AnyObject?, Error?) ->()) {
        return requestWithMethod(method: .get, urlString: urlString, params: params, completionHandler: completionHandler)
    }
    
       /*
    func getMethodWithParams(_ urlString: String , params: [String : AnyObject]?) -> DataResponse<AnyObject?> {
        return requestWithMethodParams(.get, urlString: urlString, params: params)
    }


    func requestWithMethodParams(_ method: HTTPMethod, urlString: String, params: [String : AnyObject]?) -> DataResponse<AnyObject?> {
        return Observable<AnyObject?>.create { observer -> Disposable in

          let request =  Alamofire.request(urlString, method: method, parameters: params)
            request.responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let response):
                    observer.onNext(response as AnyObject?)
                    observer.onCompleted()
                case .failure(let error):
                    debugPrint("Error \(error)")
                    observer.onError(error)
                }
           })
            return Disposables.create() {
                request.cancel()
           }
        }
        
    }*/
    
    func post(_ urlString: String , params: [String : AnyObject]?, completionHandler: @escaping(AnyObject?, NSError?) -> ()) {
        return requestWithMethod(method: .post, urlString: urlString, params: params, completionHandler:completionHandler )
    }
    
    func put(_ urlString: String , params: [String : AnyObject]?, completionHandler: @escaping(AnyObject?, NSError?) -> () ) {
        return requestWithMethod(method: .put, urlString: urlString, params: params, completionHandler:completionHandler)
    }
    
    func delete(_ urlString: String , params: [String : AnyObject]?, completionHandler: @escaping(AnyObject?, NSError?) -> ()) {
        return requestWithMethod(method: .delete, urlString: urlString, params: params, completionHandler:completionHandler)
    }
    
    
    func requestWithMethod(method methodRequest: HTTPMethod, urlString: String, params: [String : AnyObject]? , bodyParams: AnyObject? = nil, completionHandler: @escaping(AnyObject?, NSError?) -> ()){
        
        Alamofire.request(urlString, method: methodRequest, parameters: params,encoding: JSONEncoding.default, headers: nil).responseJSON { (dataResponse) in
            
            switch dataResponse.result {
            case .success(let response):
                completionHandler(response as AnyObject?, nil)
            case .failure(let error):
                completionHandler(nil, error as NSError?)
            }
        }
    }
        
    func postDataWithMultipart(_ urlString: String, imageData:[UIImage?], params:[String: AnyObject]?, completionHandler: @escaping(AnyObject?, NSError?) -> ()) {
            let _ = Alamofire.upload(multipartFormData: {
                multipartFormData in
                var name = 12
                for itemImage in imageData {
                    name += 1
                    let fileImage = "name \(name).jpg"
                    if let image = itemImage {
                        if let imageData = UIImageJPEGRepresentation(image, 0.5) {
                            multipartFormData.append(imageData, withName: "Photo", fileName: fileImage, mimeType: "image/jpg")
                        }
                    }
                }
                
                for (key, value) in params! {
                    if value is String {
                        if let StringValue = value as? String {
                            multipartFormData.append(StringValue.data(using: String.Encoding.utf8)!, withName: key)
                        }
                    } else if let IntValue = value as? Int {
                        multipartFormData.append("\(IntValue)".data(using: String.Encoding.utf8)!, withName: key)
                    }  else if let doubleValue = value as? Double {
                        multipartFormData.append("\(doubleValue)".data(using: String.Encoding.utf8)!, withName: key)
                    } else if value is NSArray {
                        do {
                            let bodyData =  try JSONSerialization.data(withJSONObject: value, options: [])
                            let body = String(data: bodyData, encoding: String.Encoding.utf8)!
                             multipartFormData.append(body.data(using: String.Encoding.utf8)!, withName: key)
                        }
                        catch {
                            
                        }
                    } else if value is Dictionary<String, Any> {
                        print("valueData")
                        print(value)
                        do {
                            let bodyData =  try JSONSerialization.data(withJSONObject: value, options:  .prettyPrinted)
//                            let body = String(data: bodyData, encoding: String.Encoding.utf8)!
                            multipartFormData.append(bodyData, withName: key)
                        }
                        catch {
                            
                        }
                    } //if value is NSArray || value is Location
                }
                
            }, to: urlString, encodingCompletion: {
                encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON(completionHandler: { (responseData) in
                        switch responseData.result {
                        case .success(let response):
                            completionHandler(response as AnyObject?, nil)
                        case .failure(let error):
                            completionHandler(nil, error as NSError?)
                        }
                    })
//                    upload.response { [weak self] response in
////                        guard self != nil else {
////                            return
////                        }
//                      
//                    }
                    
                case .failure(let error):
                    completionHandler(nil, error as NSError?)
                }

            })
        
    }
    
}


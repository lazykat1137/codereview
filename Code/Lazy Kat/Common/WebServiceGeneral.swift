//
//  WebServiceGeneral.swift
//  Lazy Kat
//
//  Created by Viral on 07/09/18.
//  Copyright © 2018 Lazy Kat. All rights reserved.
//
// http://stackoverflow.com/questions/29131253/swift-alamofire-how-to-get-the-http-response-status-code


import UIKit
import Alamofire

public enum BVServiceType {
    case inquiry
    case portfolio
}

class WebServiceGeneral
{
    static func requestGETURL(_ api : BVServiceType, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
    {
        let serURL = BASE_URL + self.getMethodName(api: api)
        
        Alamofire.request(serURL).responseJSON { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    static func requestPOSTURL(_ api : BVServiceType, params : [String : Any], success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
    {
        let serURL = BASE_URL + self.getMethodName(api: api)
//        let jwt = UserDefaults.standard.string(forKey: "HEADERJWTTOKEN")
        
        Alamofire.request(serURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (responseObject) -> Void in

            print(responseObject)

            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    static func requestPOSTURLEncoding(_ api : BVServiceType, params : [String : Any], success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
    {
        let serURL = BASE_URL + self.getMethodName(api: api)
        //        let jwt = UserDefaults.standard.string(forKey: "HEADERJWTTOKEN")
        
        Alamofire.request(serURL, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    class func uploadMultipartFormData(_ strURL : String, params : [String : AnyObject]?, imageDataArray: [Data],imageNamesArray: [String], headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (NSError) -> Void) {
        Alamofire.upload(multipartFormData: { (MultipartFormData) in
            var secondCounter = 0
            for data in imageDataArray {
                print(imageDataArray[secondCounter])
                MultipartFormData.append(data, withName: imageNamesArray[secondCounter], fileName: imageNamesArray[secondCounter] + "myImage.png", mimeType: "image/png")
                secondCounter = secondCounter + 1
            }
            
            let contentDict = params as? [String: String]
            for (key, value) in contentDict! {
                MultipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, to: strURL, method: .post, headers: nil, encodingCompletion: { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON(completionHandler: { (dataResponse) in
                    if dataResponse.result.error != nil {
                        failure(dataResponse.result.error! as NSError)
                    }
                    else {
                        print(dataResponse.result.value as Any)
                    }
                })
            case .failure(let encodingError):
                failure(encodingError as NSError)
            }
        })
    }
    
    static func getMethodName(api:BVServiceType) -> String
    {
        var method = ""
        
        switch api
        {
          case .inquiry:
               method = "inquiry.php"
            
          case .portfolio:
            method = "portfolio.php"
            
        }
        
        return method
    }
}

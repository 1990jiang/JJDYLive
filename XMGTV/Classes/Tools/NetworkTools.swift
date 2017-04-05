//
//  NetworkTools.swift
//  Alamofire的使用测试
//
//  Created by 蒋俊 on 17/3/31.
//  Copyright © 2017年 蒋俊. All rights reserved.
//

import UIKit
import Alamofire

//枚举列出请求方式
enum MethodType {
    case get
    case post
}

//这个类可以不用继承自NSObject(不用到NSObject中的类就好)
class NetworkTools  {

    /// 网络请求封装
    ///
    /// - Parameters:
    ///   - type: 网络请求类型
    ///   - URLString: 网址
    ///   - parameters: 参数:参数也许为空，默认为nil
    ///   - finishedCallback: 成功的闭包回调
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型--.get是我们自己的枚举类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result)
        }
    }
}
/*
 好懂的写法
  class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  ( result : AnyObject) -> ()) {  }
 
 //返回结果
  finishedCallback(result: result)
 
 
 
 */














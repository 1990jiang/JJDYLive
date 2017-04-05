//
//  RecommendViewModel.swift
//  XMGTV
//
//  Created by 蒋俊 on 17/4/5.
//  Copyright © 2017年 coderwhy. All rights reserved.
//

import UIKit


//不用到一些特性，就可以不继承这个class
class RecommendViewModel  {
    

}

// MARK:- 发送网络请求
extension RecommendViewModel {
    
    func requestData() {
        //1.请求第一部分推荐数据
        
        
        //2.请求第二部分颜值数据
        
        
        //3.请求后面部分游戏数据
       
        /*
         limit:是传递这个返回一次的视频个数
         offset:是视频偏移，就是请求这个后，偏移几个再请求下个视频。这里不用偏移
         time:就是时间间隔，是当前手机时间到1970年的时间间隔(秒)
         */
        
        
        //在控制台直接打印的数据很难看懂，我们拼接一下参数，直接在网页上去看
        //http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1491382590
        //print(NSDate.getCurrentTime())
        
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit":"4" , "offset" : "0", "time" : NSDate.getCurrentTime()]) { (result) in
            
            //对于打印出来的数据，我们可以进行复制到kjson这个网站，选择json在线编辑，然后看看具体的数据组成结构，分析这些数据是显示在什么位置的
            print(result)
        }
        
    }
    
    
}





















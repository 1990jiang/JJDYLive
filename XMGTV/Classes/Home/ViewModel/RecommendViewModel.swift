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
    // MARK:- 懒加载属性
    //初始化一个保存模型的数组
    fileprivate lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()

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
            
            //1.将result转换成字典类型
            guard  let resultDict = result as? [String : NSObject] else{
                
                print("未获取到游戏数据")
                return
             }
            //2.根据data这个key拿到数据数组--具体数据结构自己打印result然后在kjson网站去在线编辑json看看
           //根据字典的key取出这个数据arr,并且指定这个数据里面是保存的字典对象
            guard  let dataArray = resultDict["data"] as? [[String : NSObject]] else {
                return
            }
           //3.遍历数组，获取字典，并且将字典转成模型对象
            for dict in dataArray {
                //目前swift中没有一个完整的字典转模型的框架，我们就用KVC自己转了
                let group = AnchorGroup(dict : dict)
                //用数组存放字典
                //在闭包中要用self
                self.anchorGroups.append(group)
            }
        
            //打印来看看，两层字典转模型成功没有
            for group in self.anchorGroups {
                
                for anchor in group.anchors{
                    print(anchor.nickname)
                }
                print("--------------------")
            }
            
        }
        
    }
    
    
}





















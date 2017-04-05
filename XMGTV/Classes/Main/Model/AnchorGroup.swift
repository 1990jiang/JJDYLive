//
//  AnchorGroup.swift
//  XMGTV
//
//  Created by 蒋俊 on 17/4/5.
//  Copyright © 2017年 coderwhy. All rights reserved.
//

import UIKit

//推荐界面游戏数据模型，其实就是一个那个主播所有视频的模型

class AnchorGroup: NSObject {

    /// 该组中对应的房间信息
    var room_list : [[String : NSObject]]?{
        
        //利用属性监听器，将room_list中的字典转换为主播信息模型
        didSet {
            guard let room_list = room_list else { return }
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }

    
    //组显示的标题
    var tag_name : String = ""
    
    //组显示的图标
    var icon_name : String = "home_header_normal"

    /// 定义主播的模型对象数组
    lazy var anchors : [AnchorModel] = [AnchorModel]()
    
    //在写一个构造函数，利用kvc
    init(dict : [String : NSObject]) {
        super.init()
        
       setValuesForKeys(dict)
    }

   //由于字典中的有些key,没有用到，所以我们在重写一个方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }




}


































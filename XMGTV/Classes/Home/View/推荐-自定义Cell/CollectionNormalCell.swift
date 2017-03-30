//
//  CollectionNormalCell.swift
//  XMGTV
//
//  Created by 蒋俊 on 17/3/30.
//  Copyright © 2017年 coderwhy. All rights reserved.
//

import UIKit

// MARK:- 在布局这个normalCell的时候，图片上不是有一个label和一个btn吗？这两个小家伙在设置约束的时候，一定要以大图片为参照哦，设置方法是同时选中他们两者，再进行设置


class CollectionNormalCell: UICollectionViewCell {

    
    @IBOutlet weak var normalCellImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        normalCellImg.layer.cornerRadius = 8
        normalCellImg.layer.masksToBounds = true
    }

}

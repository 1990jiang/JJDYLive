//
//  CollectionPrettyCell.swift
//  XMGTV
//
//  Created by 蒋俊 on 17/3/31.
//  Copyright © 2017年 coderwhy. All rights reserved.
//

import UIKit


// MARK:- 在xib中布局的思路:
/*
 1.底部最左边我是用这个icon和一个label.基本约束很好设置，我们要做的一点是在这个基本的左边和下边的约束确定好以后，我们最好给已经确定的这两个东东，都加上这个高度约束。 
 2.显示主播名字的label是一个道理，确定了label的字体大小后，就给它加上一个高度约束。 这样整个约束会更加牢靠。 因为我们上面的控件都是以这个下面的这几个控件为基础的
 
 3.在设置这个大图片右上角的label的时候，label有个背景色半透明的感觉。 我们可以先给label设置一个背景色的时候，千万不要直接将lable的alpha值改小了，这样改会把文字也变得透明了
 */


class CollectionPrettyCell: UICollectionViewCell {

    //大图片
    @IBOutlet weak var prettyImg: UIImageView!
    //在线人数label
    @IBOutlet weak var onlineLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        prettyImg.layer.cornerRadius = 8
        prettyImg.layer.masksToBounds = true
    
        onlineLabel.layer.cornerRadius = 3
        onlineLabel.layer.masksToBounds = true
    
    }

}

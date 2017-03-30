//
//  RecommendViewController.swift
//  XMGTV
//
//  Created by 蒋俊 on 17/3/30.
//  Copyright © 2017年 coderwhy. All rights reserved.
//

// MARK:- 推荐控制器

import UIKit


//item间距
private let kItemMargin : CGFloat = 10
//item的宽度
private let kItemW = (kScreenW - 3 * kItemMargin) / 2
//item的高度 --大概估计的
private let kItemH = kItemW * 3 / 4

//普通cellID
private let kNormalcellID = "normalCellID"
//组头ID
private let kHeaderViewID = "headerViewID"

//item每组头部高度
private let kHeaderViewH : CGFloat = 25


class RecommendViewController: UIViewController {

    
    // MARK:- 懒加载
    fileprivate lazy var collectionView : UICollectionView = {
       //了解一下这个是什么写法--写了这个之后，我们就可以在闭包中使用self(当前类)
        [unowned self] in
        //1.布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        //行间距--基本没有
        layout.minimumLineSpacing = 0
        //item间的间距
        layout.minimumInteritemSpacing = kItemMargin
       //垂直滚动
        layout.scrollDirection = .vertical
       //设置每组头部尺寸
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        
        //2.初始化
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 64 - 44 - 64 ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.orange
        collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalcellID)
        // MARK: - 注册这个collectionView的头部
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
    
    }()
    
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

         view.backgroundColor = UIColor.white
   
        setupUI()
    }

    
    
    
    
    
    
    
    
}
// MARK:- 设置UI界面内容
extension RecommendViewController {
    func setupUI() {
       
        automaticallyAdjustsScrollViewInsets = false
        
        //1.添加collectionView
        view.addSubview(collectionView)
    

    }





}


// MARK:- collectionView数据源方法
extension RecommendViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalcellID, for: indexPath)
        
        cell.backgroundColor = UIColor.randomColor()
        
        
        
        return cell
        
    }
    
    //返回头部视图的方法
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //1.取出headerView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        headerView.backgroundColor = UIColor.randomColor()
        
    return headerView
    
    }
    
    
    
    
    
    
}







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

//普通item的宽度
private let kItemW = (kScreenW - 3 * kItemMargin) / 2

//普通item的高度 --大概估计的
private let kNorItemH = kItemW * 3 / 4

//颜值item的高度 --大概估计的
private let kPrettyItemH = kItemW * 4 / 3

//普通cellID
private let kNormalcellID = "normalCellID"

//颜值cellID
private let kPrettyCellID = "kPrettyCellID"

//组头ID
private let kHeaderViewID = "headerViewID"

//item每组头部高度
private let kHeaderViewH : CGFloat = 50


class RecommendViewController: UIViewController {

    
    // MARK:- 懒加载
    fileprivate lazy var collectionView : UICollectionView = {
       //了解一下这个是什么写法--写了这个之后，我们就可以在闭包中使用self(当前类)
        [unowned self] in
        //1.布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kNorItemH)
        //行间距--基本没有
        layout.minimumLineSpacing = 0
        //item间的间距--再次理解一下这个最小间距的意思，我们给其设置为10，就是说这个item之间的最小距离不能小于10，但是是可以大于10的，所以我们这里还需要设置这个collectionView-item的内边距，才能实现想要的左右有间距，中间有间隔的效果
        layout.minimumInteritemSpacing = kItemMargin
       //垂直滚动
        layout.scrollDirection = .vertical
       //设置每组头部尺寸
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsetsMake(0, kItemMargin, 0, kItemMargin)
        
        //2.初始化--这个collectionView的高度，要减去导航栏和状态栏，titleView,底部tabBar的高度
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 64 - 44 - 44 ), collectionViewLayout: layout)
        //不想去减掉这些高度，可以设置collectionView的宽度和高度随着父控件的高度和宽度缩放--我们在这个homeViewController中设置这个推荐控制器的view的范围。然后我们在这个推荐控制器中调用self.view.bounds的时候，它依然是屏幕尺寸，这个时候我们的collectionView的尺寸就搞成了屏幕尺寸了。而推荐控制器的View自己切缩放为父控制器中设置的了。把我们的collectionView坑惨了
        //collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
       //设置代理，在代理中来返回具体哪组cell的高度
        collectionView.delegate = self
        
        
        // MARK:- 注册不同的cell
        collectionView.register(UINib.init(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalcellID)
        collectionView.register(UINib.init(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
       // MARK: - 注册这个(从XIB注册)collectionView的头部
        
     collectionView.register(UINib.init(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
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
        //1.定义cell
        var cell : UICollectionViewCell!
        //2.取出cell
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath)
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalcellID, for: indexPath)
        }
        return cell
      
        
      
        
        
    }
    
    //返回头部视图的方法
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //1.取出headerView--就算是从XIB中创建的也不用像cell一样要去单独创建一下
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
       
        
        
    return headerView
    
    }
    
}


// MARK:- CollectionViewDelegate 代理方法
//UICollectionViewDelegateFlowLayout :这个协议是继承自UICollectionViewDelegate,因为我们是处理这个返回item的高度的，所以用这个代理协议
extension RecommendViewController : UICollectionViewDelegateFlowLayout {
    
    //返回具体某一行或某一组item的高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kPrettyItemH)
        }
        return CGSize(width: kItemW, height: kNorItemH)
    }
    
    
}




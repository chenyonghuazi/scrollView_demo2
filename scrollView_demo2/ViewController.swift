//
//  ViewController.swift
//  scrollView_demo2
//
//  Created by Edwin on 2018/1/21.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var topScrollView: UIScrollView!
    
    @IBOutlet weak var bossScrollViewView: UIView!
    @IBOutlet weak var bossScrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let topScrollData = ["sephora","mcdonalds","lenovo","swiss chalet"]
    let collectionImageSet = ["daily","electronic","food","furniture","gift catd","office"]
    let tableViewData = ["sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","sam","samExceed"]
    var contentSize:CGFloat = 0.0
    var topScrollCount:CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the big scroll view contentsize
        bossScrollView.contentSize = CGSize(width: self.view.frame.width, height: bossScrollViewView.frame.height)
        
        //setting topScrollView
        topScrollView.delegate = self
        setTopScroll()
        
        //setting myCollectionView
        setLayout()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTopScroll(){
        for image in topScrollData{
            let xcoordinate = self.view.frame.width * topScrollCount
            let imageV = UIImageView()
            imageV.image = UIImage(named: image)
            imageV.frame = CGRect(x: xcoordinate, y: 0, width: self.view.frame.width, height: self.topScrollView.frame.height)
            imageV.contentMode = .scaleAspectFill
            topScrollView.addSubview(imageV)
            topScrollView.isPagingEnabled = true
            topScrollView.showsHorizontalScrollIndicator = false
            
            contentSize = contentSize + self.view.frame.width
            topScrollCount += 1.0
        }
        topScrollView.contentSize = CGSize(width: contentSize, height: self.topScrollView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(topScrollView.contentOffset.x / self.view.frame.width)
        print(pageController.currentPage)
    }


}


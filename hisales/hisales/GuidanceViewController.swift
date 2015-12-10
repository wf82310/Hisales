//
//  GuidanceViewController.swift
//  hisales
//
//  Created by 王飞 on 15/12/3.
//  Copyright © 2015年 edaysoft.cn. All rights reserved.
//

import UIKit

class GuidanceViewController: UIViewController {
    
    @IBOutlet var viewTop: UIView!
    @IBOutlet var viewBottom: UIView!
    @IBOutlet var viewMiddle: UIView!
    var scrollView:  UIScrollView!
    
    @IBOutlet  var pageControl: UIPageControl!
    @IBOutlet  var startButton: UIButton!
    @IBOutlet  var registButton: UIButton!

    var numOfPages = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        let frameFix = self.view.bounds
        
        viewTop.frame = CGRectMake(0, 0, frameFix.size.width, frameFix.size.height*0.75)
        viewMiddle.frame = CGRectMake(0, viewTop.frame.height, frameFix.size.width, frameFix.size.height*0.125)
        viewBottom.frame = CGRectMake(0, viewMiddle.frame.origin.y+frameFix.size.height*0.125, frameFix.size.width, frameFix.size.height*0.15)
        
        
        scrollView = UIScrollView()
        scrollView.frame = viewTop.frame

        scrollView.delegate = self
        
        // scrollView的contentSize设为屏幕宽度的4(我这里设了四张引导页)倍
        scrollView.contentSize = CGSizeMake(frameFix.size.width * CGFloat(numOfPages), viewTop.frame.size.height)
        
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        
        for i in 0..<numOfPages {
            let image = UIImage(named: "Guidance\(i + 1)")
            let imageView = UIImageView(image: image)
            
            imageView.frame = CGRectMake(viewTop.frame.size.width * CGFloat(i), 0, viewTop.frame.size.width, viewTop.frame.size.height)
            
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentOffset = CGPointZero
        self.viewTop.addSubview(scrollView)
        
        pageControl.frame.size = CGSizeMake(frameFix.width, 37)
        
        
        startButton.backgroundColor =  UIColor(red: 255/255.0, green: 176/255.0, blue: 64/255.0, alpha: 1.0)
       
        startButton.layer.cornerRadius = 5.0
      
        registButton.backgroundColor =  UIColor(red: 119/255.0, green: 192/255.0, blue: 96/255.0, alpha: 1.0)
        
        registButton.layer.cornerRadius = 5.0

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func regist(sender: AnyObject) {
        //regist action
    }
    
    
    @IBAction func start(sender: AnyObject) {
        //login with existing account
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier("HomeVC") as! HomeViewController
        
        viewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        presentViewController(viewController, animated: true, completion: nil)
    }
    
    
}

// MARK: - UIScrollViewDelegate
extension GuidanceViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 随着滑动改变pageControl的状态
        pageControl.currentPage = Int(offset.x / view.bounds.width)
        // 因为currentPage是从0开始，所以numOfPages减1
//        if pageControl.currentPage == numOfPages - 1 {
//            
//            UIView.animateWithDuration(0.5) {
//               // self.startButton.alpha = 1.0
//            }
//            
//        } else {
//            
//            UIView.animateWithDuration(0.5) {
//              //  self.startButton.alpha = 0.0
//            }
//        }
    }
}

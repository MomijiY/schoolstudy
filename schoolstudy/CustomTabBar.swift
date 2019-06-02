//
//  CustomTabBar.swift
//  schoolstudy
//
//  Created by 吉川椛 on 2019/04/21.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {
    
    var  tabBarIteam = UITabBarItem()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:  UIColor.white], for: .selected)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:  UIColor.darkGray], for: .normal)
        
        let selectedImage1 = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
        let  deSelectedImage1 = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
        tabBarIteam = self.tabBar.items![0]
        tabBarIteam.image = deSelectedImage1
        tabBarIteam.selectedImage = selectedImage1
        
        let selectedImage2 = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
        let  deSelectedImage2 = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
        tabBarIteam = self.tabBar.items![1]
        tabBarIteam.image = deSelectedImage2
        tabBarIteam.selectedImage = selectedImage2
        
        let selectedImage3 = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
        let  deSelectedImage3 = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
        tabBarIteam = self.tabBar.items![2]
        tabBarIteam.image = deSelectedImage3
        tabBarIteam.selectedImage = selectedImage3
        
        let numberOfTabs = CGFloat((tabBar.items?.count)!)
        let tabBarSize = CGSize(width: tabBar.frame.width / numberOfTabs, height: tabBar.frame.height)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), size: tabBarSize)
        self.selectedIndex = 0


        // Do any additional setup after loading the view.
    }
    
   
}

extension  UIImage{
    class func imageWithColor(color: UIColor, size:  CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    }




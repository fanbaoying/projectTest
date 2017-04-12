//
//  RootTabBarController.swift
//  projectTest
//
//  Created by 范保莹 on 2017/4/11.
//  Copyright © 2017年 FBY. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.creatSubViewCotrollers()
        // Do any additional setup after loading the view.
    }

    func creatSubViewCotrollers(){
    
        let firstVC  = ViewController ()
        let item1 : UITabBarItem = UITabBarItem (title: "第一页面", image: UIImage(named: "firsts"), selectedImage: UIImage(named: "firsts"))
        firstVC.tabBarItem = item1
        
        let secondVC = SecondViewController ()
        let item2 : UITabBarItem = UITabBarItem (title: "第二页面", image: UIImage(named: "thirds"), selectedImage: UIImage(named: "thirds"))
        secondVC.tabBarItem = item2
        
        let otherVC = ThirdViewController ()
        let item3 : UITabBarItem = UITabBarItem (title: "第三页面", image: UIImage(named: "fourths"), selectedImage: UIImage(named: "fourth"))
        otherVC.tabBarItem = item3
        
        let tabArray = [firstVC,secondVC,otherVC]
        self.viewControllers = tabArray

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  DataViewController.swift
//  projectTest
//
//  Created by 范保莹 on 2017/4/11.
//  Copyright © 2017年 FBY. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    var itemString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    func initView(){
        self.title = itemString
        self.view.backgroundColor = UIColor.lightGray
        
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

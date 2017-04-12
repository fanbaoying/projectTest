//
//  ViewController.swift
//  projectTest
//
//  Created by 范保莹 on 2017/4/10.
//  Copyright © 2017年 FBY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        initView();
        creatTable()
    }
    
//    func initView(){
////        self.title = "日期"
//        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 174/255.0, green: 109/255.0, blue: 45/255.0, alpha: 1)
    
//    }
    
    func creatTable(){
        
        tableView.frame = UIScreen.main.bounds
        
        dataSource = ["周一","周二","周三","周四","周五","周六","周日"]
        view.addSubview(tableView)
        
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
//    默认返回组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//    返回行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
//    返回行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
//    头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
//    点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        取消选中样式
        tableView.deselectRow(at: indexPath, animated: true)
        
        let svc = DataViewController()
        let itemString1 = self.dataSource[indexPath.row]
//        self.performSegue(withIdentifier: "fby", sender: itemString)
        svc.itemString = itemString1
        self.navigationController!.pushViewController(svc, animated: true)

    }
    
//    传值
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "fby"{
//        let controller = segue.destination as! SecondViewController
//        controller.itemString = sender as? String
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "id")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "id")
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    
    
    /**
     提交编辑结果
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    /**
     返回按钮数组
     */
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.normal, title: "删除") { (action, indexPath) in
            print("点击了删除")
            self.dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.none)
        }
        deleteAction.backgroundColor = UIColor.red
        let moreAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.normal, title: "更多") { (action, indexPath) in
            print("点击了更多")
            tableView.reloadData()
        }
        moreAction.backgroundColor = UIColor.orange
        let topAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.normal, title: "置顶") { (action, indexPath) in
            print("点击了置顶")
            self.dataSource.insert(self.dataSource[indexPath.row], at: 0)
            self.dataSource.remove(at: indexPath.row + 1)
            self.tableView.reloadData()
        }
        
        return [deleteAction,moreAction,topAction]
    }
}


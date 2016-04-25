//
//  DepartmentNewVC.swift
//  01-员工管理
//
//  Created by GeekerHua on 15/12/24.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class DepartmentNewVC: UIViewController {

    @IBOutlet weak var noText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    var completion: (() -> ())?
    
    
    @IBAction func save(sender: AnyObject) {
        // 实例化一个部门对象
        if noText.text != nil && nameText.text != nil {
            let dep = Department(no: noText.text, name: nameText.text)
            if dep.insert() {
                print("插入成功")
                // 直接调用闭包
                completion?()
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                print("插入失败")
            }
        }
    }
}

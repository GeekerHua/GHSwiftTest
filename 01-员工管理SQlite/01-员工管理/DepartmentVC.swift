//
//  DepartmentVC.swift
//  01-员工管理
//
//  Created by GeekerHua on 15/12/24.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class DepartmentVC: UITableViewController {
    var depList : [Department]?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData(){
        depList = Department.departmentList()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is DepartmentNewVC {
            let vc = segue.destinationViewController as! DepartmentNewVC
            weak var weakSelf = self
            vc.completion = {
                weakSelf?.loadData()
                weakSelf?.tableView.reloadData()
            }
        }
    }
    
    
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return depList?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DepCell")!
        cell.textLabel?.text = depList![indexPath.row].name
        return cell
    }
}

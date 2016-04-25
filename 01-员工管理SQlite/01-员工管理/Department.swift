//
//  Department.swift
//  01-员工管理
//
//  Created by GeekerHua on 15/12/24.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import Foundation

class Department {
    // 主键的代号
    var id: Int?
    // 编号
    var no: String?
    // 名称
    var name: String?
    
    init(record: [AnyObject]){
        id = (record[0] as! Int)
        no = (record[1] as! String)
        name = (record[2] as! String)
    }
    
    init(no: String?, name: String?) {
        self.id = 0
        self.no = no
        self.name = name
    }
    
    // 插入到数据库
    func insert() -> Bool{
        let sql = "INSERT INTO T_Department (DepartmentNo, Name) VALUES ('\(no!)', '\(name!)')"
//        print(sql)
        return SQLite.sharedSQLite.execSQL(sql)
    }
    
    
    class func departmentList() -> [Department]? {
        let sql = "SELECT id, DepartmentNo, Name FROM T_Department"
        let list = SQLite.sharedSQLite.recordSet(sql)
        
        var dataList = [Department]()
        // 遍历数组，生成对象
        for record in list!{
            dataList.append(Department(record: record as! [AnyObject]))
        }
        
//        print(list)
        return dataList
    }
}
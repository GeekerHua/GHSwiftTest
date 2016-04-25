//
//  SQLite.swift
//  01-员工管理
//
//  Created by GeekerHua on 15/12/24.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import Foundation

// 数据库操作

/**
    1. 打开数据库
    2. 如果没有数据表，先创表
    3.数据操作
*/
class SQLite {
    private static let instance = SQLite()
    class var sharedSQLite: SQLite {
        return instance
    }
    
    var db : COpaquePointer = nil
    
    func openDataBase(dbname: String) -> Bool {
        let path = dbname.documentPath()
        print(path)
        if sqlite3_open(path, &db) == SQLITE_OK {
            print("打开数据库成功")
            if createTable() {
                print("创建数据表成功")
                // 测试查询数据
//                let sql = "SELECT id, DepartmentNo, Name FROM T_Department"
//                recordSet(sql)
            } else {
                print("创建数据表失败")
            }
        } else {
            print("打开数据库失败")
        }
        return false
    }
    
    func createTable() -> Bool {
        // 准备所有数据表的SQL
        
        let sql = "CREATE TABLE \n" +
            "IF NOT EXISTS T_Department (\n" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,\n" +
            "DepartmentNo CHAR(10) NOT NULL DEFAULT '',\n" +
            "Name CHAR(50) NOT NULL DEFAULT '' \n" +
            "); \n" +
            "CREATE TABLE IF NOT EXISTS T_Employee ( \n" +
            "'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, \n" +
            "'name' TEXT NOT NULL, \n" +
            "'age' INTEGER NOT NULL, \n" +
            "'department_id' INTEGER, \n" +
            "CONSTRAINT 'FK_DEP_ID' FOREIGN KEY ('department_id') REFERENCES 'T_Department' ('id') \n" +
        ");"

        return execSQL(sql)
    }
    
    // 执行没有返回值的SQL语句
    func execSQL(sql:String) -> Bool{
      return sqlite3_exec(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, nil, nil, nil) == SQLITE_OK
    }
    
    // 执行SQL，返回一个结果集(OC对象数组)
    func recordSet(sql: String) -> [AnyObject]?{
//        1.准备语句
        var stmt: COpaquePointer = nil
        var recordList : [AnyObject]?
        if sqlite3_prepare_v2(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, &stmt, nil) == SQLITE_OK {
            // 查询结果的数组
            recordList = [AnyObject]()
            // 单步获取SQL执行结果
            while sqlite3_step(stmt) == SQLITE_ROW {
                // 获取每一条记录的返回值
                recordList!.append(recordData(stmt))
            }
        }
        // 释放语句
        sqlite3_finalize(stmt)
        return recordList
    }
    
    // 获取每一条数据的记录
    func recordData(stmt: COpaquePointer) -> AnyObject{
        // 获取到记录
        let count = sqlite3_column_count(stmt)
//        print("获取到记录，共有多少列\(count)")
        // 利用一个数组所有数据
        var data = [AnyObject]()
        
        for i in 0..<count {
            let type = sqlite3_column_type(stmt, i)
            switch type {
            case SQLITE_INTEGER:
                data.append(Int(sqlite3_column_int64(stmt, i)))
//                print("整数 \(sqlite3_column_int64(stmt, i))")
            case SQLITE_FLOAT:
                data.append(sqlite3_column_double(stmt, i))
//                print("小树 \(sqlite3_column_double(stmt, i))")
            case SQLITE_NULL:
                data.append(NSNull())
//                print("空\(NSNull())")
            case SQLITE_TEXT:
                let chars = UnsafePointer<CChar>(sqlite3_column_text(stmt, i))
                let str = String(CString: chars, encoding: NSUTF8StringEncoding)
                data.append(str!)
//                print("字符串\(str!)")
            case let type:
                print("不支持的类型\(type)")
            }
//            print(sqlite3_column_type(stmt, i))
        }
        return data
    }
}


//
//  DataBaseManager.swift
//  PerfectTemplate
//
//  Created by xuntou-2 on 2018/7/12.
//


import PerfectSQLite

let dbPath = "/Users/xuntou-2/Documents/Perfect/PerfectTemplate/Sources/perfect.sqlite"

open class DataBaseManager {
    
    /// 获取整表
    ///
    /// - Parameter tableName: 表名
    /// - Returns: 表数据
    func loadAll(tableName: String) -> [Dictionary<String, String>]? {
        var resultArray = [Dictionary<String, String>]()
        do {
            let sqlite = try SQLite(dbPath)
            defer {
                sqlite.close() // 确保数据库连接已关闭
            }
            
            let demoStatement = "SELECT * FROM " + tableName
            try sqlite.forEachRow(statement: demoStatement) {(statement: SQLiteStmt, i:Int) -> () in
                resultArray.append([
                    "id": statement.columnText(position: 0),
                    "level": statement.columnText(position: 1)
                    ])
            }
            
        } catch {
            //处理错误
        }
        return resultArray
    }
    
    
    /// 查询
    ///
    /// - Parameters:
    ///   - tableName: 表名
    ///   - key: 查询条件key
    ///   - value: 查询条件value
    /// - Returns: 查询结果
    func selectAll(tableName: String, key: String, value: String) -> [Dictionary<String, String>]? {
        var resultArray = [Dictionary<String, String>]()
        do {
            let sqlite = try SQLite(dbPath)
            defer {
                sqlite.close() // 确保数据库连接已关闭
            }
            //"DELETE FROM \(tableName) WHERE \(key) = '\(value)'"
            let demoStatement = "SELECT * FROM \(tableName) WHERE \(key) = '\(value)'"
            try sqlite.forEachRow(statement: demoStatement) {(statement: SQLiteStmt, i:Int) -> () in
                resultArray.append([
                    "id": statement.columnText(position: 0),
                    "level": statement.columnText(position: 1)
                    ])
            }
        } catch {
            //处理错误
        }
        return resultArray
    }
    
    func insert(tableName: String, value: String) {
        
    }
    
    
    // 删除
//    func delete(tableName: String, key: String, value: String) {
//        var resultArray = [Dictionary<String, String>]()
//        do {
//            let sqlite = try SQLite(dbPath)
//            defer {
//                sqlite.close() // 确保数据库连接已关闭
//            }
//
//            let demoStatement = "DELETE FROM \(tableName) WHERE \(key) = '\(value)'"
//            sqlite.execute(statement: demoStatement) { (statement: SQLiteStmt) in
//
//            }
//            try sqlite.forEachRow(statement: demoStatement) {(statement: SQLiteStmt, i:Int) -> () in
//                resultArray.append([
//                    "id": statement.columnText(position: 0),
//                    "level": statement.columnText(position: 1)
//                    ])
//            }
//        } catch {
//            //处理错误
//        }
//        return resultArray
//    }
    
    
    //"UPDATE \(tableName) SET \(keyValue) WHERE \(whereKey) = '\(whereValue)'"
    
    //"insert into \(tableName)(\(fieldNameAll)) values(\(valueAll))"
}




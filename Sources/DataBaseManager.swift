//
//  DataBaseManager.swift
//  PerfectTemplate
//
//  Created by xuntou-2 on 2018/7/12.
//


import PerfectSQLite

let dbPath = "/Users/xuntou-2/Documents/Perfect/PerfectTemplate/Sources/perfect.sqlite"

open class DataBaseManager {
    
    /// 执行sql
    func executeGetSql(sql: String) -> [Dictionary<String, String>]? {
        var resultArray = [Dictionary<String, String>]()
        do {
            let sqlite = try SQLite(dbPath)
            defer {
                sqlite.close() // 在完成数据请求后自动关闭数据库连接
            }
            try sqlite.forEachRow(statement: sql) {(statement: SQLiteStmt, i:Int) -> () in
                var dic = [String: String]()
                for index in 0...statement.columnCount() - 1{
                    let key = statement.columnName(position: index)
                    let value = statement.columnText(position: index)
                    dic.updateValue(value, forKey: key)
                }
                resultArray.append(dic)
            }
        } catch {
            //处理错误
        }
        return resultArray
    }
    
    
    /// 获取整表data
    ///
    /// - Parameter tableName: 表名
    /// - Returns: 表数据
    func loadAll(tableName: String) -> [Dictionary<String, String>]? {
        var resultArray = [Dictionary<String, String>]()
        do {
            let sqlite = try SQLite(dbPath)
            defer {
                sqlite.close() // 在完成数据请求后自动关闭数据库连接
            }
            
            let demoStatement = "SELECT * FROM " + tableName
            try sqlite.forEachRow(statement: demoStatement) {(statement: SQLiteStmt, i:Int) -> () in
                var dic = [String: String]()
                for index in 0...statement.columnCount() - 1{
                    let key = statement.columnName(position: index)
                    let value = statement.columnText(position: index)
                    dic.updateValue(value, forKey: key)
                }
                resultArray.append(dic)
            }
            
        } catch {
            //处理错误
        }
        return resultArray
    }
    
    
    /// 查询整表匹配data
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
                sqlite.close() // 在完成数据请求后自动关闭数据库连接
            }
            //"DELETE FROM \(tableName) WHERE \(key) = '\(value)'"
            let demoStatement = "SELECT * FROM \(tableName) WHERE \(key) = '\(value)'"
            try sqlite.forEachRow(statement: demoStatement) {(statement: SQLiteStmt, i:Int) -> () in
                var dic = [String: String]()
                for index in 0...statement.columnCount() - 1{
                    let key = statement.columnName(position: index)
                    let value = statement.columnText(position: index)
                    dic.updateValue(value, forKey: key)
                }
                resultArray.append(dic)
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
//                sqlite.close() // 在完成数据请求后自动关闭数据库连接
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




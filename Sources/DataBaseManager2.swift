//
//  DataBaseManager2.swift
//  PerfectTemplate
//
//  Created by xuntou-2 on 2018/7/25.
//

import PerfectSQLite

//let dbPath = "/Users/xuntou-2/Documents/Perfect/PerfectTemplate/Sources/perfect.sqlite"


open class DataBaseManager2 {
    

    var content = [Dictionary<String, String>]()
    var page = Int()
    
    
    func loadPageContent(forPage: Int) {
        do {
            let sqlite = try SQLite(dbPath)
            defer {
                sqlite.close()  // 在完成数据请求后自动关闭数据库连接
            }
            let sqlStatement = "SELECT post_content, post_title FROM posts ORDER BY id DESC LIMIT 5 OFFSET :1"
            
            try sqlite.forEachRow(statement: sqlStatement, doBindings: {
                (statement: SQLiteStmt) -> () in
                
                let bindPage: Int
                if self.page == 0 || self.page == 1 {
                    bindPage = 0
                } else {
                    bindPage = forPage * 5 - 5
                }
                
                try statement.bind(position: 1, bindPage)
            }) {
                (statement: SQLiteStmt, i:Int) -> () in
                self.content.append([
                    "postContent": statement.columnText(position: 0),
                    "postTitle": statement.columnText(position: 1)
                    ])
            }
        } catch {
        }
    }
}

//
//  ApiMethods.swift
//  PerfectTemplate
//
//  Created by xuntou-2 on 2018/7/13.
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

func handler(request: HTTPRequest, response: HTTPResponse) {
    let result = DataBaseManager().loadAll(tableName: "level")
    let jsonString = baseResponseBodyJSONData(status: 200, message: "成功", data: result)
    response.setBody(string: jsonString)
    response.completed()
}

func simpleData(request: HTTPRequest, response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
    let d: [String:Any] = ["a":1, "b":0.1, "c": true, "d":[2, 4, 5, 7, 8]]
    do {
        try response.setBody(json: d)
    } catch {
    }
    response.completed()
}

func getLevel(request: HTTPRequest, response: HTTPResponse) {
    let result = DataBaseManager().selectAll(tableName: "level", key: "id", value: "1000")
    let jsonString = baseResponseBodyJSONData(status: 200, message: "成功", data: result)
    response.setBody(string: jsonString)
    response.completed()
}

// post
func insert(request: HTTPRequest, response: HTTPResponse) {
    let paa = request.postParams[0].0
    let decoded: Dictionary<String, Any>
    do {
        decoded = (try paa.jsonDecode() as? Dictionary)!
        print("key", decoded["key"] ?? "null")
        print("foo", decoded["foo"]!)
        print("ddd", decoded["ddd"] ?? "null")
    } catch  {
        
    }
 
}

// http://0.0.0.0:8181/select?id=1&value=22
//  get
func selectOne(request: HTTPRequest, response: HTTPResponse) {
    
//    let id = request.params(named: "id")[0]
//    let value = request.params(named: "value")[0]
//    print(id, value)
//
//    let queryParams = request.queryParams
//    for i in 0...queryParams.count - 1{
//        let partArr = queryParams[i]
//        print(partArr.0, partArr.1)
//    }
    
    let sql = "SELECT * FROM level"
    let result = DataBaseManager().executeGetSql(sql: sql)
    let jsonString = baseResponseBodyJSONData(status: 200, message: "成功", data: result)
    response.setBody(string: jsonString)
    response.completed()
}

//
//  Tools.swift
//  PerfectTemplate
//
//  Created by xuntou-2 on 2018/7/13.
//

//MARK: 通用响应格式
func baseResponseBodyJSONData(status: Int, message: String, data: Any!) -> String {
    
    var result = Dictionary<String, Any>()
    result.updateValue(status, forKey: "status")
    result.updateValue(message, forKey: "message")
    if (data != nil) {
        result.updateValue(data, forKey: "data")
    }else{
        result.updateValue("", forKey: "data")
    }
    guard let jsonString = try? result.jsonEncodedString() else {
        return ""
    }
    return jsonString
}

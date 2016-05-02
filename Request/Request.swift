//
//  Request.swift
//  Request
//
//  Created by luojie on 16/5/2.
//  Copyright © 2016年 LuoJie. All rights reserved.
//

import Foundation

protocol ServerType {
    static var baseURL: String { get }
    
    var api: String { get }
    var method: ServerMethod { get }
    var params: [String: AnyObject]? { get }
}

extension ServerType {
    func request(success success: ([String: AnyObject] -> Void), failure: ((Int?, String?) -> Void)? = nil) {
        let url = self.dynamicType.baseURL + api
        switch method {
        case .Get:
            Request.get(url: url, params: params, success: success, failure: failure)
        case .Post:
            Request.post(url: url, params: params, success: success, failure: failure)
        }
    }
}

enum Server: ServerType {
    static var baseURL = ""
    
    case GetVideoInfo(id: Int)
    case GetNotes(id: Int, page: Int)
    
    var api: String {
        switch self {
        case .GetVideoInfo: return "api/id"
        case .GetNotes:     return "api/noteFromId"
        }
    }
    
    var method: ServerMethod {
        switch self {
        case .GetVideoInfo: return .Get
        case .GetNotes:     return .Post
        }
    }
    
    var params: [String: AnyObject]? {
        switch self {
        case let .GetVideoInfo(id):
            return ["courseId": id]
        case let .GetNotes(id, page):
            return [
                "courseId": id,
                "pages": page
            ]
        }
    }
    
}

enum ServerMethod: String {
    case Get
    case Post
}

struct Request {
    static func get(url url: String, params: [String: AnyObject]?, success: ([String: AnyObject] -> Void), failure: ((Int?, String?) -> Void)? = nil) { }
    static func post(url url: String, params: [String: AnyObject]?, success: ([String: AnyObject] -> Void), failure: ((Int?, String?) -> Void)? = nil) { }
}
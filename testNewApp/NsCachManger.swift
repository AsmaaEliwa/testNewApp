//
//  NsCachManger.swift
//  testNewApp
//
//  Created by asmaa gamal  on 29/02/2024.
//

import Foundation
class NsCachManger{
    let cache = NSCache<NSString,AnyObject>()
    func savInCache(obj:AnyObject){
        cache.setObject(obj, forKey: NSString(string: "\(obj.self)"))
    }
    func checkexistinc(obj:AnyObject)->AnyObject?{
        if let myObj =  (cache.object(forKey: NSString(string: "\(obj.self)"))){
            return myObj
        }
        return nil
    }
}

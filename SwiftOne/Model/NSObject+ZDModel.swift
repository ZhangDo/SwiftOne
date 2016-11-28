//
//  NSObject+Add.swift
//  ZZJModel
//
//  Created by chenmengjia on 16/8/11.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import Foundation


/**
 数据类型
 */
public enum zz_type :Int{
    case number
    case string
    case bool
    case array
    case dictionary
    case null
    case unknown
}

private let zz_queue = DispatchQueue(label: "zz_zzjmodel_queie_serial", attributes: [])
extension NSObject{
    
    /**
     任意类型  如果传入的是任意类型 主动转成字典 如果不成功返回空对象
     
     - parameter obj: 任意对象
     
     - returns: 模型
     */
    static func zz_objToModel(_ obj:AnyObject?)->NSObject?{
        if let dic = obj as? [String:AnyObject]{
            return zz_dicToModel(dic)
        }
        return nil
    }
    
    /**
     字典转模型
     
     - parameter dic: 字典
     - returns: 模型
     */
    static func zz_dicToModel(_ dic:[String:AnyObject])->NSObject?{
        if dic.first == nil {
            return nil
        }
        let t = (self.classForCoder() as! NSObject.Type).init()
        let properties = t.zz_modelPropertyClass()
        for (k,v) in dic{
            if t.zz_getVariableWithClass(self.classForCoder(), varName: k){ //如果存在这个属性
                if t.zz_isBasic(t.zz_getType(v)){
//                    print(t.classForCoder)
                    //基础类型 可以直接赋值
//                    print("\(k)--\(v)--\(t.zz_getType(v))")
                    t.setValue(v,forKey: k)
                }else{
                    //复杂类型
                    let type = t.zz_getType(v)
                    if type == .dictionary{
                        //是一个对象类型
                        if let dic1 = v as? [String : AnyObject]{
                            if t.responds(to: #selector(NSObject.zz_modelPropertyClass)){
                                if let properties = properties{
                                    if  t.value(forKey: k) == nil{
                                        //初始化
                                        let obj = (properties[k] as! NSObject.Type).init()
                                        t.setValue(obj, forKey: k)
                                    }
                                }
                            }
                            if let obj = t.value(forKey: k){
                                (obj as AnyObject).setDicValue(dic1) //有对象就递归
                            }
                        }
                    }else if type == .array{
                        //数组类型
                        if let arr = v as? [AnyObject]{
                            if !arr.isEmpty {
                                if t.zz_isBasic(t.zz_getType(arr.first!)) {
                                    //数组中的内容是基本类型
                                    t.setValue(arr, forKey: k)
                                }else{
                                    if t.zz_getType(arr.first!) == .dictionary{
                                        //对象数组
                                        var objs:[NSObject] = []
                                        for dic in arr{
                                            if let properties = properties{
                                            let obj = (properties[k] as! NSObject.Type).init()
                                            objs.append(obj)
                                                zz_queue.async {
                                                   //串行对列执行
                                                   obj.setDicValue(dic as! [String : AnyObject])
                                                }
                                            }
                                        }
                                        t.setValue(objs, forKey: k)
                                    }
                                }
                            }
                        }
                    }
                }
            
            }
        }
        return t
    }
    
    
    /**
     逐级递归 遍历赋值给对象
     
     - parameter dic1: 字典
     */
    func setDicValue(_ dic1:[String : AnyObject]){
        for (k,v) in dic1{
            
            if self.zz_getVariableWithClass(self.classForCoder, varName: k){
                //判断是否存在这个属性
                if self.zz_isBasic(self.zz_getType(v)){
                    //设置基本类型
                    if self.zz_getType(v) == .bool{
                        //TODO: -Bool类型怎么处理  不懂
//                      self.setValue(Bool(v as! NSNumber), forKey: k)
                        
                    }else{
                        self.setValue(v, forKey: k)
                    }
                }else if self.zz_getType(v) == .dictionary{
                    if let dic1 = v as? [String : AnyObject]{
                        if self.responds(to: #selector(NSObject.zz_modelPropertyClass)){
                            if let properties = self.zz_modelPropertyClass(){
                                if  self.value(forKey: k) == nil{
                                    //初始化
                                    let obj = (properties[k] as! NSObject.Type).init()
                                    self.setValue(obj, forKey: k)
                                }
                            }
                        }
                        if let obj = self.value(forKey: k){
                            (obj as AnyObject).setDicValue(dic1) //递归
                        }
                    }
                }
                
            }
        }
    }
    
    
    /**
     判断类型
     
     - parameter v: 参数
     
     - returns: 类型
     */
     fileprivate func zz_getType(_ v:AnyObject)->zz_type{
        switch v{
        case let number as NSNumber:
            if number.zz_isBool {
                return .bool
            } else {
                return .number
            }
        case _ as String:
            return .string
        case _ as NSNull:
            return .null
        case _ as [AnyObject]:
            return .array
        case _ as [String : AnyObject]:
            return .dictionary
        default:
            return .unknown
        }
    }
    
    
    /**
     是否为基础类型
     
     - parameter type: 类型
     
     - returns: true/false
     */
    fileprivate func zz_isBasic(_ type:zz_type)->Bool{
        if type == .bool || type == .string || type == .number {
            return true
        }
        return false
    }
    
    /**
     留给子类有实体属性的去继承
     
     - returns: k , 实体
     */
    func zz_modelPropertyClass()->[String:AnyClass]?{
        return nil
    }
   
    /**
     判断对象中是否包含某个属性
     
     - parameter cla:     类
     - parameter varName: 变量名
     
     - returns: bool
     */
    func zz_getVariableWithClass(_ cla:AnyClass , varName:String)->Bool{
        var outCount:UInt32 = 0
        let ivars = class_copyIvarList(cla, &outCount)
        for i in 0..<outCount{
            let property = ivars?[Int(i)]
            let keyName = String(cString: ivar_getName(property))
            if keyName == varName{
                free(ivars)
                return true
            }
        }
        free(ivars)
        return false
    }
    
}

private let zz_trueNumber = NSNumber(value: true as Bool)
private let zz_falseNumber = NSNumber(value: false as Bool)
private let zz_trueObjCType = String(cString: zz_trueNumber.objCType)
private let zz_falseObjCType = String(cString: zz_falseNumber.objCType)
// MARK: - 判断是否为bool
extension NSNumber {
    var zz_isBool:Bool {
        get {
            let objCType = String(cString: self.objCType)
            if (self.compare(zz_trueNumber) == ComparisonResult.orderedSame && objCType == zz_trueObjCType)
                || (self.compare(zz_falseNumber) == ComparisonResult.orderedSame && objCType == zz_falseObjCType){
                    return true
            } else {
                return false
            }
        }
    }
}

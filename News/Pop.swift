//
//  Pop.swift
//  News
//
//  Created by Dongdong on 16/5/31.
//  Copyright © 2016年 com. All rights reserved.
//

import Foundation

protocol Animal {
    var name:String { get }
    var canFly:Bool { get }
    var canSwim:Bool { get }
}


protocol Flyable {
    
}

protocol Swimable {
    
}

extension Animal {
    var canFly:Bool { return false }
    
    var canSwim:Bool { return false }
}

extension Animal where Self:Flyable {
    var canFly:Bool { return true }
}

extension Animal where Self:Swimable {
    var canSwim:Bool { return true }
}

struct Bird:Animal,Flyable {
    var name:String
}

struct Fish:Animal,Swimable {
    var name:String
}

struct Penguin {
    var name:String
}


func swapTwoValues<T>(inout a:T, inout _ b:T) {
    let temp = a
    a = b
    b = temp
}

func appendItem<T>(inout arr:[T],appendArr:[T]) {
    for item in appendArr {
        arr.append(item)
    }
}

public class Person : NSObject{
    override init() {
        var name:String? {
            didSet {
                objc_sync_enter(self)
                if let n = name {
                    print(n)
                }
                objc_sync_exit(self)
            }
        }
    }
}

public func test<SrcType, DescType>(src: [SrcType], desc: SrcType -> DescType) -> [DescType] {
    var result = [DescType]()
    for item in src {
        result.append(desc(item))
    }
    return result
}


extension Array {
    public func myFilter<T>(predicate:T -> Bool) -> [T] {
        var value = [T]()
        
        for item in self {
            if predicate(item as! T) {
                value.append(item as! T)
            }
        }
        return value
    }
    
    
    public func myMap<SrcType,DescType>(transform:SrcType -> DescType) -> [DescType] {
        var output = [DescType]()
        
        for item in self {
            let transformed = transform(item as! SrcType)
            output.append(transformed)
        }
        
        return output
    }
    
    public func myReduce<C,T>(initial:C, combine:(C,T) -> C) -> C {
        var seed = initial
        for item in self {
            seed = combine(seed, item as! T)
        }
        return seed
    }
}












//
//  Taskable.swift
//  SwiftTest
//
//  Created by prongbang on 12/10/2567 BE.
//

import Foundation

public class Taskable {
    
    let processable: Processable
    
    public init(processable: Processable) {
        self.processable = processable
    }
    
    public func returnsBool() -> Bool {
        return processable.returnsBool()
    }
    
    public func returnsOptionalString() -> String? {
        processable.returnsOptionalString()
    }
    
    public func funcWithOneOptionalArg(value: Int?) {
        processable.funcWithOneOptionalArg(value: value)
    }
    
    public func funcWithOneArg(value: Int) {
        processable.funcWithOneArg(value: value)
    }
    
    public func funcWithTwoArgs(value1: Int, value2: String) {
        processable.funcWithTwoArgs(value1: value1, value2: value2)
    }
    
    public func funcWithArrayOfDicts(values: [[String : Int]]) {
        processable.funcWithArrayOfDicts(values: values)
    }
    
    public func funcWithActionArgs(value1: Int, value2: String) {
        processable.funcWithActionArgs(value1: value1, value2: value2)
    }
    
    public func funcWithArgAndReturnValue(value: String) -> Int {
        return processable.funcWithArgAndReturnValue(value: value)
    }
    
    public func funcWhichThrows() throws -> String {
        return try processable.funcWhichThrows()
    }
    
    public func voidFunc() {
        processable.voidFunc()
    }
    
}

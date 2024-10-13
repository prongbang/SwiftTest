//
//  ProcessableMock.swift
//  SwiftTestTests
//
//  Created by prongbang on 12/10/2567 BE.
//

@testable import SwiftMock
@testable import SwiftTest

class ProcessableMock: Mock<Processable>, Processable {
    
    func returnsBool() -> Bool {
        accept() as! Bool
    }
        
    func returnsOptionalString() -> String? {
        accept() as? String
    }
    
    func funcWithOneOptionalArg(value: Int?) {
        accept(args: [value])
    }
    
    func funcWithOneArg(value: Int) {
        accept(args: [value])
    }
    
    func funcWithTwoArgs(value1: Int, value2: String) {
        accept(args: [value1, value2])
    }
    
    func funcWithArrayOfDicts(values: [[String : Int]]) {
        accept(args: values)
    }
    
    func funcWithActionArgs(value1: Int, value2: String) {
        accept(checkArgs: [], actionArgs: [value1, value2])
    }
    
    func funcWithArgAndReturnValue(value: String) -> Int {
        accept(args: [value]) as! Int
    }

    func funcWhichThrows() throws -> String {
        try throwingAccept() as! String
    }

    func voidFunc() {
        accept()
    }

}

//
//  Processable.swift
//  SwiftTest
//
//  Created by prongbang on 12/10/2567 BE.
//

public protocol Processable {
    func returnsBool() -> Bool
    func returnsOptionalString() -> String?
    func funcWithOneOptionalArg(value: Int?)
    func funcWithOneArg(value: Int)
    func funcWithTwoArgs(value1: Int, value2: String)
    func funcWithArrayOfDicts(values: [[String:Int]])
    func funcWithActionArgs(value1: Int, value2: String)
    func funcWithArgAndReturnValue(value: String) -> Int
    func funcWhichThrows() throws -> String
    func voidFunc()
}

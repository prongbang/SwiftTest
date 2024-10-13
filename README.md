# SwiftTest

- Processable.swift

```swift
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
```

- ProcessableMock.swift

```swift
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
```

- TaskableTests.swift

```swift

import XCTest
@testable import SwiftTest

// Define the custom error for testing
enum MyError: Error {
    case someError
}

final class TaskableTests: XCTestCase {
    
    private let mock = ProcessableMock.create()
    private var task: Taskable!

    override func setUp() {
        super.setUp()
        task = Taskable(processable: mock)
    }

    func testReturnsBool() {
        // Given
        mock.expect { $0.returnsBool() }
            .returning(true)

        // When
        let result = task.returnsBool()

        // Then
        XCTAssertTrue(result)
    }

    func testReturnsOptionalString() {
        // Given
        mock.expect { $0.returnsOptionalString() }
            .returning("Hello")

        // When
        let result = task.returnsOptionalString()

        // Then
        XCTAssertEqual(result, "Hello")
    }

    func testFuncWithOneOptionalArg() {
        // Given
        mock.expect { $0.funcWithOneOptionalArg(value: 42) }

        // When
        task.funcWithOneOptionalArg(value: 42)

        // Then
        mock.verify()
    }

    func testFuncWithOneArg() {
        // Given
        mock.expect { $0.funcWithOneArg(value: 42) }

        // When
        task.funcWithOneArg(value: 42)

        // Then
        mock.verify()
    }

    func testFuncWithTwoArgs() {
        // Given
        mock.expect { $0.funcWithTwoArgs(value1: 42, value2: "test") }

        // When
        task.funcWithTwoArgs(value1: 42, value2: "test")

        // Then
        mock.verify()
    }

    func testFuncWithArrayOfDicts() {
        // Given
        let values = [["key": 1]]
        mock.expect { $0.funcWithArrayOfDicts(values: values) }

        // When
        task.funcWithArrayOfDicts(values: values)

        // Then
        mock.verify()
    }

    func testFuncWithActionArgs() {
        // Given
        mock.expect { $0.funcWithActionArgs(value1: 42, value2: "test") }

        // When
        task.funcWithActionArgs(value1: 42, value2: "test")

        // Then
        mock.verify()
    }

    func testFuncWithArgAndReturnValue() {
        // Given
        mock.expect { $0.funcWithArgAndReturnValue(value: "input") }
            .returning(10)

        // When
        let result = task.funcWithArgAndReturnValue(value: "input")

        // Then
        XCTAssertEqual(result, 10)
    }

    func testFuncWhichThrows() {
        // Given
        mock.expect { try $0.funcWhichThrows() }
            .throwing(MyError.someError)

        // When
        XCTAssertThrowsError(try task.funcWhichThrows()) { error in
            // Then
            XCTAssertEqual(error as? MyError, MyError.someError)
        }
        mock.verify()
    }

    func testVoidFunc() {
        // Given
        mock.expect { $0.voidFunc() }

        // When
        task.voidFunc()

        // Then
        mock.verify()
    }
    
}
```
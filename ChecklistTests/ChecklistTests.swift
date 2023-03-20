//
//  ChecklistTests.swift
//  ChecklistTests
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import XCTest
@testable import Checklist

final class ChecklistTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTodoModel() throws {
        let task = "task exmaple"
        let time = "Mon"
        let status = false
        let todo = Todo(task: task, time: time, status: status)
        XCTAssertEqual(todo.task, task)
        XCTAssertEqual(todo.time, time)
        XCTAssertEqual(todo.status, status)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

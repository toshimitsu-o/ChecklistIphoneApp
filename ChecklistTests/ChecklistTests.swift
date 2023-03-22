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
        let isDone = false
        let todo = Todo(task: task, time: time, isDone: isDone)
        XCTAssertEqual(todo.task, task)
        XCTAssertEqual(todo.time, time)
        XCTAssertEqual(todo.isDone, isDone)
    }
    
    func testChecklist() throws {
        XCTAssertEqual(checklist[0].task, "Read Swift book")
        XCTAssertEqual(checklist[1].time, "Tue")
        XCTAssertEqual(checklist[2].task, "Do workshop tasks")
        XCTAssertEqual(checklist[3].task, "Attend workshop")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

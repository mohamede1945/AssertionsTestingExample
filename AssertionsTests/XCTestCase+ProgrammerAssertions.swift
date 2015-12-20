//
//  XCTestCase+ProgrammerAssertions.swift
//  Assertions
//
//  Created by Mohamed Afifi on 12/20/15.
//  Copyright © 2015 mohamede1945. All rights reserved.
//

import Foundation
import XCTest
@testable import Assertions

private let noReturnFailureWaitTime = 0.1

public extension XCTestCase {

    public func assertAssert(
        expectedMessage: String? = nil,
        file: StaticString = __FILE__,
        line: UInt = __LINE__,
        testcase: () -> Void
        ) {

            expectAssertionReturnFunction("assert", file: file, line: line, function: { (caller) -> () in

                Assertions.assertClosure = { condition, message, _, _ in
                    caller(condition, message)
                }

                }, expectedMessage: expectedMessage, testCase: testcase) { () -> () in
                    Assertions.assertClosure = Assertions.swiftAssertClosure
            }
    }

    public func assertAssertionFailure(
        expectedMessage: String? = nil,
        file: StaticString = __FILE__,
        line: UInt = __LINE__,
        testcase: () -> Void
        ) {

            expectAssertionReturnFunction("assertionFailure", file: file, line: line, function: { (caller) -> () in

                Assertions.assertionFailureClosure = { message, _, _ in
                    caller(false, message)
                }

                }, expectedMessage: expectedMessage, testCase: testcase) { () -> () in
                    Assertions.assertionFailureClosure = Assertions.swiftAssertionFailureClosure
            }
    }

    public func assertPrecondition(
        expectedMessage: String? = nil,
        file: StaticString = __FILE__,
        line: UInt = __LINE__,
        testcase: () -> Void
        ) {

            expectAssertionReturnFunction("precondition", file: file, line: line, function: { (caller) -> () in

                Assertions.preconditionClosure = { condition, message, _, _ in
                    caller(condition, message)
                }

                }, expectedMessage: expectedMessage, testCase: testcase) { () -> () in
                    Assertions.preconditionClosure = Assertions.swiftPreconditionClosure
            }
    }

    public func assertPreconditionFailure(
        expectedMessage: String? = nil,
        file: StaticString = __FILE__,
        line: UInt = __LINE__,
        testcase: () -> Void
        ) {

            expectAssertionNoReturnFunction("preconditionFailure", file: file, line: line, function: { (caller) -> () in

                Assertions.preconditionFailureClosure = { message, _, _ in
                    caller(message)
                }

                }, expectedMessage: expectedMessage, testCase: testcase) { () -> () in
                    Assertions.preconditionFailureClosure = Assertions.swiftPreconditionFailureClosure
            }
    }

    public func assertFatalError(
        expectedMessage: String? = nil,
        file: StaticString = __FILE__,
        line: UInt = __LINE__,
        testcase: () -> Void) {

            expectAssertionNoReturnFunction("fatalError", file: file, line: line, function: { (caller) -> () in

                Assertions.fatalErrorClosure = { message, _, _ in
                    caller(message)
                }

                }, expectedMessage: expectedMessage, testCase: testcase) { () -> () in
                    Assertions.fatalErrorClosure = Assertions.swiftFatalErrorClosure
            }
    }

    private func expectAssertionReturnFunction(
        functionName: String,
        file: StaticString,
        line: UInt,
        function: (caller: (Bool, String) -> Void) -> Void,
        expectedMessage: String? = nil,
        testCase: () -> Void,
        cleanUp: () -> ()
        ) {

            let expectation = expectationWithDescription(functionName + "-Expectation")
            var assertion: (condition: Bool, message: String)? = nil

            function { (condition, message) -> Void in
                assertion = (condition, message)
                expectation.fulfill()
            }

            // perform on the same thread since it will return
            testCase()

            waitForExpectationsWithTimeout(0) { _ in

                defer {
                    // clean up
                    cleanUp()
                }

                guard let assertion = assertion else {
                    XCTFail(functionName + " is expected to be called.", file: file.stringValue, line: line)
                    return
                }

                XCTAssertFalse(assertion.condition, functionName + " condition expected to be false", file: file.stringValue, line: line)

                if let expectedMessage = expectedMessage {
                    // assert only if not nil
                    XCTAssertEqual(assertion.message, expectedMessage, functionName + " called with incorrect message.", file: file.stringValue, line: line)
                }
            }
    }

    private func expectAssertionNoReturnFunction(
        functionName: String,
        file: StaticString,
        line: UInt,
        function: (caller: (String) -> Void) -> Void,
        expectedMessage: String? = nil,
        testCase: () -> Void,
        cleanUp: () -> ()
        ) {

            let expectation = expectationWithDescription(functionName + "-Expectation")
            var assertionMessage: String? = nil

            function { (message) -> Void in
                assertionMessage = message
                expectation.fulfill()
            }

            // act, perform on separate thead because a call to function runs forever
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), testCase)

            waitForExpectationsWithTimeout(noReturnFailureWaitTime) { _ in

                defer {
                    // clean up
                    cleanUp()
                }

                guard let assertionMessage = assertionMessage else {
                    XCTFail(functionName + " is expected to be called.", file: file.stringValue, line: line)
                    return
                }

                if let expectedMessage = expectedMessage {
                    // assert only if not nil
                    XCTAssertEqual(assertionMessage, expectedMessage, functionName + " called with incorrect message.", file: file.stringValue, line: line)
                }
            }
    }
}
//
//  ProgrammerAssertionsExampleTests.swift
//  AssertionsTests
//
//  Created by Mohamed Afifi on 12/20/15.
//  Copyright © 2015 mohamede1945. All rights reserved.
//

import XCTest
@testable import Assertions


/// ### IMPORTANT HOW TO USE ###
/// 1. Drop `ProgrammerAssertions.swift` to the target of your app or framework under test. Just besides your source code.
/// 2. Drop `XCTestCase+ProgrammerAssertions.swift` to your test target. Just besides your test cases.
/// 3. Use `assert`, `assertionFailure`, `precondition`, `preconditionFailure` and `fatalError` normally as you always do.
/// 4. Unit test them with the new methods `expectAssert`, `expectAssertionFailure`, `expectPrecondition`, `expectPreconditionFailure` and `expectFatalError`.
///
/// This file is just an example of how to unit test the functions.
/// When you run tests, you should expect many of them to fail. This is normally, because the test cases tests the error message produced by expectXXX methods.
/// For a complete project example see https://github.com/mohamede1945/AssertionsTestingExample

class AssertionsTestsExample: XCTestCase {

    // assert tests

    func testAssertNotCalled() {
        expectAssert("Zero division") {
        }
    }

    func testAssertTrueCondition() {
        expectAssert("Zero division") {
            divideAssert(1, by: 1)
        }
    }

    func testAssertNoMessage() {
        expectAssert() {
            divideAssert(1, by: 0)
        }
    }

    func testAssertErrorIncorrectMessage() {
        expectAssert("Invalid") {
            divideAssert(1, by: 0)
        }
    }

    func testAssertCorrectMessage() {
        expectAssert("Zero division") {
            divideAssert(1, by: 0)
        }
    }

    // expectionFailure tests

    func testAssertionFailureNotCalled() {
        expectAssertionFailure("Zero division") {
            divideAssertionFailure(1, by: 1)
        }
    }

    func testAssertionFailureNoMessage() {
        expectAssertionFailure() {
            divideAssertionFailure(1, by: 0)
        }
    }

    func testAssertionFailureErrorIncorrectMessage() {
        expectAssertionFailure("Invalid") {
            divideAssertionFailure(1, by: 0)
        }
    }

    func testAssertionFailureCorrectMessage() {
        expectAssertionFailure("Zero division") {
            divideAssertionFailure(1, by: 0)
        }
    }


    // precondition tests

    func testPreconditionNotCalled() {
        expectPrecondition("Zero division") {
        }
    }

    func testPreconditionTrueCondition() {
        expectPrecondition("Zero division") {
            dividePrecondition(1, by: 1)
        }
    }

    func testPreconditionNoMessage() {
        expectPrecondition() {
            dividePrecondition(1, by: 0)
        }
    }

    func testPreconditionErrorIncorrectMessage() {
        expectPrecondition("Invalid") {
            dividePrecondition(1, by: 0)
        }
    }

    func testPreconditionCorrectMessage() {
        expectPrecondition("Zero division") {
            dividePrecondition(1, by: 0)
        }
    }


    // preconditionFailure tests

    func testPreconditionFailureNotCalled() {
        expectPreconditionFailure("Zero division") {
            dividePreconditionFailure(1, by: 1)
        }
    }

    func testPreconditionFailureNoMessage() {
        expectPreconditionFailure() {
            dividePreconditionFailure(1, by: 0)
        }
    }

    func testPreconditionFailureErrorIncorrectMessage() {
        expectPreconditionFailure("Invalid") {
            dividePreconditionFailure(1, by: 0)
        }
    }

    func testPreconditionFailureCorrectMessage() {
        expectPreconditionFailure("Zero division") {
            dividePreconditionFailure(1, by: 0)
        }
    }

    // fatalError tests

    func testFatalErrorNotCalled() {
        expectFatalError("Zero division!") {
            divideFatalError(1, by: 1)
        }
    }

    func testFatalErrorNoMessage() {
        expectFatalError() {
            divideFatalError(1, by: 0)
        }
    }

    func testFatalErrorIncorrectMessage() {
        expectFatalError("Invalid") {
            divideFatalError(1, by: 0)
        }
    }

    func testFatalCorrectMessage() {
        expectFatalError("Zero division") {
            divideFatalError(1, by: 0)
        }
    }
}

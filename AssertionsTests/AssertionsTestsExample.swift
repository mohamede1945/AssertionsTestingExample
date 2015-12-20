//
//  AssertionsTestsExample.swift
//  AssertionsTests
//
//  Created by Mohamed Afifi on 12/20/15.
//  Copyright © 2015 mohamede1945. All rights reserved.
//

// **** IMPORTANT HOW TO USE ****
// This file is just an example of how to use the assertion functions.
// For an example see https://github.com/mohamede1945/AssertionsTestingExample

import XCTest
@testable import Assertions

class AssertionsTestsExample: XCTestCase {

    // assert tests

    func testAssertNotCalled() {
        assertAssert("Zero division") {
        }
    }

    func testAssertTrueCondition() {
        assertAssert("Zero division") {
            divideAssert(1, by: 1)
        }
    }

    func testAssertNoMessage() {
        assertAssert() {
            divideAssert(1, by: 0)
        }
    }

    func testAssertErrorIncorrectMessage() {
        assertAssert("Invalid") {
            divideAssert(1, by: 0)
        }
    }

    func testAssertCorrectMessage() {
        assertAssert("Zero division") {
            divideAssert(1, by: 0)
        }
    }

    // assertionFailure tests

    func testAssertionFailureNotCalled() {
        assertAssertionFailure("Zero division") {
            divideAssertionFailure(1, by: 1)
        }
    }

    func testAssertionFailureNoMessage() {
        assertAssertionFailure() {
            divideAssertionFailure(1, by: 0)
        }
    }

    func testAssertionFailureErrorIncorrectMessage() {
        assertAssertionFailure("Invalid") {
            divideAssertionFailure(1, by: 0)
        }
    }

    func testAssertionFailureCorrectMessage() {
        assertAssertionFailure("Zero division") {
            divideAssertionFailure(1, by: 0)
        }
    }


    // precondition tests

    func testPreconditionNotCalled() {
        assertPrecondition("Zero division") {
        }
    }

    func testPreconditionTrueCondition() {
        assertPrecondition("Zero division") {
            dividePrecondition(1, by: 1)
        }
    }

    func testPreconditionNoMessage() {
        assertPrecondition() {
            dividePrecondition(1, by: 0)
        }
    }

    func testPreconditionErrorIncorrectMessage() {
        assertPrecondition("Invalid") {
            dividePrecondition(1, by: 0)
        }
    }

    func testPreconditionCorrectMessage() {
        assertPrecondition("Zero division") {
            dividePrecondition(1, by: 0)
        }
    }


    // preconditionFailure tests

    func testPreconditionFailureNotCalled() {
        assertPreconditionFailure("Zero division") {
            dividePreconditionFailure(1, by: 1)
        }
    }

    func testPreconditionFailureNoMessage() {
        assertPreconditionFailure() {
            dividePreconditionFailure(1, by: 0)
        }
    }

    func testPreconditionFailureErrorIncorrectMessage() {
        assertPreconditionFailure("Invalid") {
            dividePreconditionFailure(1, by: 0)
        }
    }

    func testPreconditionFailureCorrectMessage() {
        assertPreconditionFailure("Zero division") {
            dividePreconditionFailure(1, by: 0)
        }
    }

    // fatalError tests

    func testFatalErrorNotCalled() {
        assertFatalError("Zero division!") {
            divideFatalError(1, by: 1)
        }
    }

    func testFatalErrorNoMessage() {
        assertFatalError() {
            divideFatalError(1, by: 0)
        }
    }

    func testFatalErrorIncorrectMessage() {
        assertFatalError("Invalid") {
            divideFatalError(1, by: 0)
        }
    }

    func testFatalCorrectMessage() {
        assertFatalError("Zero division") {
            divideFatalError(1, by: 0)
        }
    }
}

//
//  ProgrammerAssertionsExampleDivide.swift
//  Assertions
//
//  Created by Mohamed Afifi on 12/20/15.
//  Copyright © 2015 mohamede1945. All rights reserved.
//

import UIKit

/// ### IMPORTANT HOW TO USE ###
/// 1. Drop `ProgrammerAssertions.swift` to the target of your app or framework under test. Just besides your source code.
/// 2. Drop `XCTestCase+ProgrammerAssertions.swift` to your test target. Just besides your test cases.
/// 3. Use `assert`, `assertionFailure`, `precondition`, `preconditionFailure` and `fatalError` normally as you always do.
/// 4. Unit test them with the new methods `expectAssert`, `expectAssertionFailure`, `expectPrecondition`, `expectPreconditionFailure` and `expectFatalError`.
///
/// This file is just an example of how to use the functions. Normally as you would do previously.
/// For a complete project example see https://github.com/mohamede1945/AssertionsTestingExample

func divideAssert(x: Float, by y: Float) -> Float {

    assert(y != 0, "Zero division")

    return x / y
}

func divideAssertionFailure(x: Float, by y: Float) -> Float {

    guard y != 0 else {
        assertionFailure("Zero division")
        return Float.infinity
    }

    return x / y
}


func dividePrecondition(x: Float, by y: Float) -> Float {

    precondition(y != 0, "Zero division")

    return x / y
}

func dividePreconditionFailure(x: Float, by y: Float) -> Float {

    guard y != 0 else {
        preconditionFailure("Zero division")
    }

    return x / y
}

func divideFatalError(x: Float, by y: Float) -> Float {

    guard y != 0 else {
        fatalError("Zero division")
    }
    
    return x / y
}
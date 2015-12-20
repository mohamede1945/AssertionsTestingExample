//
//  ProgrammerAssertions.swift
//  Assertions
//
//  Created by Mohamed Afifi on 12/20/15.
//  Copyright © 2015 mohamede1945. All rights reserved.
//

// **** IMPORTANT HOW TO USE ****
// Drop this file to the target of your app or framework under test. Just besides your source code.
// For an example see https://github.com/mohamede1945/AssertionsTestingExample

import Foundation

/// drop-in replacements

public func assert(@autoclosure condition: () -> Bool, @autoclosure _ message: () -> String = "", file: StaticString = __FILE__, line: UInt = __LINE__) {
    Assertions.assertClosure(condition(), message(), file, line)
}

public func assertionFailure(@autoclosure message: () -> String = "", file: StaticString = __FILE__, line: UInt = __LINE__) {
    Assertions.assertionFailureClosure(message(), file, line)
}

public func precondition(@autoclosure condition: () -> Bool, @autoclosure _ message: () -> String = "", file: StaticString = __FILE__, line: UInt = __LINE__) {
    Assertions.preconditionClosure(condition(), message(), file, line)
}

@noreturn public func preconditionFailure(@autoclosure message: () -> String = "", file: StaticString = __FILE__, line: UInt = __LINE__) {
    Assertions.preconditionFailureClosure(message(), file, line)
    runForever()
}

@noreturn public func fatalError(@autoclosure message: () -> String = "", file: StaticString = __FILE__, line: UInt = __LINE__) {
    Assertions.fatalErrorClosure(message(), file, line)
    runForever()
}

/// Stores custom assertions closures, by default it points to Swift functions. But test target can override them.
public class Assertions {

    public static var assertClosure              = swiftAssertClosure
    public static var assertionFailureClosure    = swiftAssertionFailureClosure
    public static var preconditionClosure        = swiftPreconditionClosure
    public static var preconditionFailureClosure = swiftPreconditionFailureClosure
    public static var fatalErrorClosure          = swiftFatalErrorClosure

    public static let swiftAssertClosure              = { Swift.assert($0, $1, file: $2, line: $3) }
    public static let swiftAssertionFailureClosure    = { Swift.assertionFailure($0, file: $1, line: $2) }
    public static let swiftPreconditionClosure        = { Swift.precondition($0, $1, file: $2, line: $3) }
    public static let swiftPreconditionFailureClosure = { Swift.preconditionFailure($0, file: $1, line: $2) }
    public static let swiftFatalErrorClosure          = { Swift.fatalError($0, file: $1, line: $2) }
}

/// This is a `noreturn` function that runs forever and doesn't return.
/// Used by assertions with `@noreturn`.
@noreturn private func runForever() {
    repeat {
        NSRunLoop.currentRunLoop().run()
    } while (true)
}

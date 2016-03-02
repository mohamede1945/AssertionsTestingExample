# AssertionsTestingExample

Finally, you can achieve 100% coverage. Previously, you couldn't because you cannot test `assert`, `assertionFailure`, `precondition`, `preconditionFailure` and `fatalError`. But now with every easy steps you can test them.

This is an example app to show you how to do it. When you test `command + U` the app. You will find many test cases fail. This is intentional, to show that `expectAssert` for example fails the test case with a proper error message when the assert function is not called.

When you go to the coverage, you finally can see that we have **100%** coverage.

### HOW TO USE ###
1. Drop `ProgrammerAssertions.swift` to the target of your app or framework under test. Just besides your source code.
2. Drop `XCTestCase+ProgrammerAssertions.swift` to your test target. Just besides your test cases.
3. Use `assert`, `assertionFailure`, `precondition`, `preconditionFailure` and `fatalError` normally as you always do.
4. Unit test them with the new methods `expectAssert`, `expectAssertionFailure`, `expectPrecondition`, `expectPreconditionFailure` and `expectFatalError`.

For example:
If you have a function that does a division like the following:

```swift
func divideFatalError(x: Float, by y: Float) -> Float {

    guard y != 0 else {
        fatalError("Zero division")
    }
    
    return x / y
}
```

You can test the 0 division with the following code.
```swift
func testFatalCorrectMessage() {
    expectFatalError("Zero division") {
        divideFatalError(1, by: 0)
    }
}
```

Or if you don't want to test the message, you simply do.
```swift
func testFatalErrorNoMessage() {
    expectFatalError() {
        divideFatalError(1, by: 0)
    }
}
```


## Attributions

Thanks to [nschum](http://stackoverflow.com/users/168939/nschum) and [Ken Ko](http://stackoverflow.com/users/3406736/ken-ko) they have the credit for creating these reusable files. I just added very few stuff.


## Author

Mohamed Afifi, mohamede1945@gmail.com

## License

AssertionsTestingExample is available under the MIT license. See the LICENSE file for more info.

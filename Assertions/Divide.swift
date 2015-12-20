//
//  Divide.swift
//  Assertions
//
//  Created by Mohamed Afifi on 12/20/15.
//  Copyright © 2015 mohamede1945. All rights reserved.
//

import UIKit

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
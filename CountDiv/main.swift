//
//  main.swift
//  CountDiv
//
//  Created by kwon on 2021/06/26.
//

import Foundation
import Glibc

public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
    var start = A
    var end = B

    while start % K != 0 {
        start += 1
    }

    while end % K != 0 {
        end -= 1
    }

    return (end / K) - (start / K) + 1
}

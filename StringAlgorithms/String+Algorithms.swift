//
//  String+Algorithms.swift
//  StringAlgorithms
//
//  Created by Edmund Mok on 9/1/17.
//  Copyright © 2017 Edmund Mok. All rights reserved.
//

import Foundation

extension String {
    func hammingDistance(to other: String) -> Int {
        // Hamming distance requires both strings to be the same length
        guard self.count == other.count else { return -1 }
        return zip(self, other).reduce(0) { $0 + ($1.0 == $1.1 ? 0 : 1) }
    }

    func levenshteinDistance(to other: String) -> Int {
        let shortString: String
        let longString: String
        let shortLength: Int
        let longLength: Int
        let length = self.count
        let otherLength = other.count

        // Identify shorter string
        if length <= otherLength {
            // self is shorter or equal
            shortString = self
            shortLength = length
            longString = other
            longLength = otherLength
        } else {
            // other is shorter
            shortString = other
            shortLength = otherLength
            longString = self
            longLength = length
        }

        let shortStringChars = shortString.map { $0 }
        let longStringChars = longString.map { $0 }

        var memo = [[Int]]()
        memo.append(Array<Int>(0..<shortLength+1))
        memo.append(Array<Int>(repeating: 0, count: shortLength+1))
        memo[1][0] = 1

        // Fill up next few rows
        for i in 1..<longLength+1 {
            memo[1][0] = i

            for j in 1..<shortLength+1 {
                let indicator = shortStringChars[j-1] == longStringChars[i-1] ? 0 : 1
                memo[1][j] = min(memo[0][j] + 1,
                                 min(memo[1][j-1] + 1,
                                     memo[0][j-1] + indicator))
            }

            // Update memo
            memo[0] = memo[1]
            memo[1] = Array<Int>(repeating: 0, count: shortLength+1)
        }

        return memo[0][shortLength]
    }
}

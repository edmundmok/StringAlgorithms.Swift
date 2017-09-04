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
        let (shortString, longString) = identifyShortLongString(first: self, second: other)
        let shortLength = shortString.count
        let longLength = longString.count
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

    private func identifyShortLongString(first: String, second: String) -> (shortString: String, longString: String) {
        if first.count <= second.count {
            return (first, second)
        }
        return (second, first)
    }

    func longestCommonSubsequence(other: String) -> Int {
        let (shortString, longString) = identifyShortLongString(first: self, second: other)
        let shortLength = shortString.count
        let longLength = longString.count
        let shortStringChars = shortString.map { $0 }
        let longStringChars = longString.map { $0 }

        var memo = [[Int]](repeating: Array<Int>(repeating: 0, count: shortLength+1), count: 2)

        for i in 1..<longLength+1 {
            memo[1][0] = 0

            for j in 1..<shortLength+1 {
                if shortStringChars[j-1] == longStringChars[i-1] {
                    memo[1][j] = memo[0][j-1] + 1
                    continue
                }

                memo[1][j] = max(memo[0][j], memo[1][j-1])
            }
            memo[0] = memo[1]
            memo[1] = Array<Int>(repeating: 0, count: shortLength+1)
        }

        return memo[0][shortLength]
    }

    func longestCommonSubstring(other: String) -> String {
        let (shortString, longString) = identifyShortLongString(first: self, second: other)
        let shortLength = shortString.count
        let longLength = longString.count
        let shortStringChars = shortString.map { $0 }
        let longStringChars = longString.map { $0 }

        var memo = [[Int]](repeating: Array<Int>(repeating: 0, count: shortLength+1), count: 2)
        var maxSubstringLength = 0
        var maxSubstring = ""

        for i in 1..<longLength+1 {
            memo[1][0] = 0

            for j in 1..<shortLength+1 {
                guard shortStringChars[j-1] == longStringChars[i-1] else {
                    memo[1][j] = 0
                    continue
                }
                memo[1][j] = memo[0][j-1] + 1
                if memo[1][j] > maxSubstringLength {
                    maxSubstring = String(shortStringChars[j-maxSubstringLength-1..<j])
                    maxSubstringLength = memo[1][j]
                }

            }
            memo[0] = memo[1]
            memo[1] = Array<Int>(repeating: 0, count: shortLength+1)
        }

        return maxSubstring
    }

}

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
        let (shortString, longString) = identifyShortLongStrings(first: self, second: other)
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

    private func identifyShortLongStrings(first: String, second: String) -> (shortString: String, longString: String) {
        if first.count <= second.count {
            return (first, second)
        }
        return (second, first)
    }

    func longestCommonSubsequence(other: String) -> Int {
        let (shortString, longString) = identifyShortLongStrings(first: self, second: other)
        let shortLength = shortString.count
        let longLength = longString.count
        let shortStringChars = shortString.map { $0 }
        let longStringChars = longString.map { $0 }

        var memo = [[Int]](repeating: Array<Int>(repeating: 0, count: shortLength+1), count: 2)

        for i in 1..<longLength+1 {
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
        let (shortString, longString) = identifyShortLongStrings(first: self, second: other)
        let shortLength = shortString.count
        let longLength = longString.count
        let shortStringChars = shortString.map { $0 }
        let longStringChars = longString.map { $0 }

        var memo = [[Int]](repeating: Array<Int>(repeating: 0, count: shortLength+1), count: 2)
        var maxSubstringLength = 0
        var maxSubstring = ""

        for i in 1..<longLength+1 {
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

    func longestCommonSubsequence(other: String) -> String {
        if self.isEmpty || other.isEmpty {
            return ""
        }

        // Compute full LCS table
        let (shortString, longString) = identifyShortLongStrings(first: self, second: other)
        let shortLength = shortString.count
        let longLength = longString.count
        let shortStringChars = shortString.map { $0 }
        let longStringChars = longString.map { $0 }

        var memo = [[Int]](repeating: Array<Int>(repeating: 0, count: shortLength+1), count: longLength+1)

        for i in 1..<longLength+1 {
            for j in 1..<shortLength+1 {
                if shortStringChars[j-1] == longStringChars[i-1] {
                    memo[i][j] = memo[i-1][j-1] + 1
                    continue
                }

                memo[i][j] = max(memo[i-1][j], memo[i][j-1])
            }
        }

        // Traceback for actual sequence
        return backtrack(memo: memo, shortStringChars: shortStringChars, longStringChars: longStringChars, i: longLength, j: shortLength)
    }

    private func backtrack(memo: [[Int]], shortStringChars: [Character], longStringChars: [Character], i: Int, j: Int) -> String {
        if i == 0 || j == 0 {
            return ""
        }

        if shortStringChars[j-1] == longStringChars[i-1] {
            return backtrack(memo: memo, shortStringChars: shortStringChars, longStringChars: longStringChars, i: i-1, j: j-1) + String(shortStringChars[j-1])
        }

        return memo[i-1][j] > memo[i][j-1]
            ?  backtrack(memo: memo, shortStringChars: shortStringChars, longStringChars: longStringChars, i: i-1, j: j)
            :  backtrack(memo: memo, shortStringChars: shortStringChars, longStringChars: longStringChars, i: i, j: j-1)
    }
}

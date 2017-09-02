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
        return 0
    }
}

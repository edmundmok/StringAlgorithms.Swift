//
//  TrieTests.swift
//  StringAlgorithmsTests
//
//  Created by Edmund Mok on 9/10/17.
//  Copyright © 2017 Edmund Mok. All rights reserved.
//

import XCTest
@testable import StringAlgorithms

class TrieTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testTrieInsert() {
        let trie = Trie<Int>()
        trie.insert(key: "test", val: 1)
        XCTAssertEqual(trie.get(key: "test"), 1)

        trie.insert(key: "tes", val: 99)
        XCTAssertEqual(trie.get(key: "tes"), 99)

        trie.insert(key: "tester", val: 3)
        XCTAssertEqual(trie.get(key: "tester"), 3)

        _ = trie.delete(key: "tester")
        XCTAssertNil(trie.get(key: "tester"))
        XCTAssertEqual(trie.get(key: "tes"), 99)
        XCTAssertEqual(trie.get(key: "test"), 1)

        _ = trie.delete(key: "tes")
        XCTAssertNil(trie.get(key: "tes"))
        XCTAssertEqual(trie.get(key: "test"), 1)
    }

}

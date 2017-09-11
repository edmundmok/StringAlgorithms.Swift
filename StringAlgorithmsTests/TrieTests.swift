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

    func testTriePrefixesOfString() {
        let trie = Trie<Int>()
        trie.insert(key: "test", val: 1)
        XCTAssertEqual(trie.getPrefixes(of: "tests"), ["test"])

        trie.insert(key: "testing", val: 2)
        XCTAssertEqual(trie.getPrefixes(of: "testings"), ["test", "testing"])
    }

    func testGetKeysStartingWithPrefix() {
        let trie = Trie<Int>()
        trie.insert(key: "tests", val: 2)
        trie.insert(key: "test", val: 1)
        trie.insert(key: "dog", val: 3)
        trie.insert(key: "cat", val: 3)
        XCTAssertEqual(Set<String>(trie.keys(startingWithPrefix: "te")), Set<String>(["tests", "test"]))
    }

    func testKeys() {
        let trie = Trie<Int>()
        trie.insert(key: "tests", val: 2)
        trie.insert(key: "test", val: 1)
        trie.insert(key: "dog", val: 3)
        trie.insert(key: "cat", val: 3)
        XCTAssertEqual(Set<String>(trie.keys()), Set<String>(["tests", "test", "dog", "cat"]))
    }

    func testItems() {
        let trie = Trie<Int>()
        trie.insert(key: "tests", val: 2)
        trie.insert(key: "test", val: 1)
        trie.insert(key: "dog", val: 3)
        trie.insert(key: "cat", val: 3)
        let dict = [ "tests": 2,
                     "test": 1,
                     "dog": 3,
                     "cat": 3 ]
        XCTAssertEqual(trie.items(), dict)
    }

}

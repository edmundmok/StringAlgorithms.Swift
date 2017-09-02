//
//  StringAlgorithmsTests.swift
//  StringAlgorithmsTests
//
//  Created by Edmund Mok on 9/1/17.
//  Copyright © 2017 Edmund Mok. All rights reserved.
//

import XCTest
@testable import StringAlgorithms

class StringAlgorithmsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testHammingDistance() {
        XCTAssertEqual("karolin".hammingDistance(to: "kathrin"), 3)
        XCTAssertEqual("karolin".hammingDistance(to: "kerstin"), 3)
        XCTAssertEqual("1011101".hammingDistance(to: "1001001"), 2)
        XCTAssertEqual("2173896".hammingDistance(to: "2233796"), 3)
    }
    
    func testLevenshteinDistance() {
        XCTAssertEqual("".levenshteinDistance(to: "test"), 4)
        XCTAssertEqual("hi".levenshteinDistance(to: ""), 2)
        XCTAssertEqual("meilenstein".levenshteinDistance(to: "levenshtein"), 4)
        XCTAssertEqual("kitten".levenshteinDistance(to: "sitting"), 3)
        XCTAssertEqual("Saturday".levenshteinDistance(to: "Sunday"), 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
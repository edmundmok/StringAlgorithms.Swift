# StringAlgorithms.Swift
String algorithms and data structures, implemented in Swift.

[![Build Status](https://travis-ci.com/edmundmok/StringAlgorithms.Swift.svg?token=sz6NJLTyDnxDVsendXPi&branch=travis-ci)](https://travis-ci.com/edmundmok/StringAlgorithms.Swift)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://github.com/edmundmok/StringAlgorithms.Swift)
[![Language](https://img.shields.io/badge/language-swift-orange.svg)](https://github.com/edmundmok/StringAlgorithms.Swift)
[![License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/edmundmok/StringAlgorithms.Swift)

## Requirements
- iOS 8.0+
- Xcode 9
- Swift 4

## Installation
### CocoaPods
Install CocoaPods
```
$ gem install cocoapods
```

Add the following to your `Podfile`:
```ruby
target '<Your Target Name>' do
    pod `StringAlgorithms`
end
```

Install the pod
```
pod install
```

### Manual Install
Fork / Clone this repo, build the framework and add the built `StringAlgorithms.framework` into your Xcode project.

## Documentation
### Algorithms
|Algorithm|Format|
|---|---|
|Hamming Distance|`a.hammingDistance(to: b)`|
|Levenshtein Distance|`a.levenshteinDistance(to: b)`|
|Optimal String Alignment|`a.optimalStringAlignmentDistance(to: b)`|
|Damerau-Levenshtein Distance|`a.damerauLevenshteinDistance(to: b)`|
|Longest Common Subsequence|`a.longestCommonSubsequence(other: b)`|
|Longest Common Substring|`a.longestCommonSubstring(other: b)`|

### Data Structures
- Trie

## License
![MIT License](LICENSE)

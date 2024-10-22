//
//  TestUtility.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 23/10/24.
//

import Foundation

final class TestUtility {
    
    static func readDataFromPlist(_ filename: String) -> NSDictionary? {
        var plistData: NSDictionary?
        if let path = Bundle(for: self).path(forResource: filename, ofType: ".plist") {
            plistData = NSDictionary(contentsOfFile: path)
        }
        return plistData
    }
}

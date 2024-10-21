//
//  NErrors.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation

enum NErrors: Error {
    case unknownError
    
    var massage: String {
        switch self {
        case .unknownError:
            return "something went wrong"
        }
    }
}

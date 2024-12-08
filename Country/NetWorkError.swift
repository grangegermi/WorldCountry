//
//  NetWorkError.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import Foundation

enum NetworkError : String, Error{
    case invalid = "Invalid URL"
    case invalidResponse = "invalid Response from server"
    case invalidData = "invalid data from Server"
}

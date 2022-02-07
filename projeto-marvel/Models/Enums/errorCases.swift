//
//  errorCases.swift
//  projeto-marvel
//
//  Created by C94279A on 06/12/21.
//

import Foundation

enum ErrorCases: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Inavalid response from the server.Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
    case emptyData = "Something is wrong, please try again"
}

//
//  httpClient.swift
//  projeto-marvel
//
//  Created by C94279A on 14/01/22.
//

import Foundation

protocol HttpClient {
    func getData(method: HTTPMethod, completion: @escaping (Result<APIResult, ErrorCases>) -> Void)
}

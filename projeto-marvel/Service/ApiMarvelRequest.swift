//
//  ApiRequest.swift
//  projeto-marvel
//
//  Created by C94279A on 01/12/21.
//

import Foundation
import UIKit


class ApiMarvelRequest: HttpClient {
    
    var urlCall = UrlApiMarvel()
    var paginacao = false
    var statusCode: Int = 0
    
    func getData(method: HTTPMethod, completion: @escaping (Result<APIResult, ErrorCases>) -> Void) {
        
        if let url = URL(string: urlCall.url()) {
            self.paginacao = true
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                self.paginacao = false
                
                if let data = data {
                    do{
                        let decoder = JSONDecoder()
                        let jsonResult = try decoder.decode(APIResult.self, from: data)
                        self.urlCall.offset += 20
                        completion(.success(jsonResult))
                        if let response = response as? HTTPURLResponse{
                            self.statusCode  = response.statusCode
                            print(self.statusCode)
                        }
                    }catch {
                        completion(.failure(.invalidData)
                        )}
                }
            }
            .resume()
        }
    }
    
}




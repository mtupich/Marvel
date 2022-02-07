//
//  API-NOVO.swift
//  projeto-marvel
//
//  Created by C94279A on 26/11/21.
//

import Foundation


class UrlApiMarvel {
    
    let callMD5 = md5()
    var offset = 0
    let baseURL = "http://gateway.marvel.com"
    let path = "v1/public/characters"
    
    let publicKey = Bundle.main.object(forInfoDictionaryKey: "publicKey") as! String
    let privateKey = Bundle.main.object(forInfoDictionaryKey: "privateKey") as! String
    
    let ts = Int(Date().timeIntervalSince1970)
    
    func url() -> String {
        let content = String(ts) + privateKey + publicKey
        let hash = callMD5.MD5(string: content)
        let urlString = baseURL + "/" + path + "?" + "&offset=\(self.offset)" + "&ts=\(ts)" + "&apikey=\(publicKey)" + "&hash=\(hash)"
        print(urlString)
        return urlString
    }
    
    func urlSearchNamesHero(nameStartWith: String ) -> String {
        let content = String(ts) + privateKey + publicKey
        let hash = callMD5.MD5(string: content)
        let nameStartWith = (nameStartWith != "") ? "&nameStartsWith=\(String(describing: nameStartWith.replacingOccurrences(of: " ", with: "%20")))" : ""
        let urlString = baseURL + "/" + path + "?" + "&offset=\(self.offset)" + "&ts=\(ts)" + "&apikey=\(publicKey)" + "&hash=\(hash)" + "\(nameStartWith)"
        return urlString
    }
}



//
//  Character.swift
//  projeto-marvel
//
//  Created by C94279A on 21/11/21.
//

import Foundation
import UIKit

struct APIResult: Codable {
    var data: ApiHeroData
}

struct ApiHeroData: Codable {
    var count: Int
    var results: [Hero]
}

struct Hero: Codable{
    
    var name: String
    var description: String
    var thumbnail: APIImageResult
    let comics, series: Comics
    var urls: [[String: String]]
    
}


// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String
    let name: String?
}

// MARK: - Thumbnail
struct APIImageResult: Codable {
    let path: String
    let `extension`: String
    
    
}


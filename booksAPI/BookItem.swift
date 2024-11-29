//
//  BookItem.swift
//  booksAPI
//
//  Created by Yernur Adilbek on 11/24/24.
//

import Foundation
import SwiftyJSON

struct BookItem {
    var title = ""
    var authors = ""
    var publishedDate = ""
    var description = ""
    var thumbnailLink = ""
    var webReaderLink = ""
    var averageRating = 0.0
    var ratingsCount = 0
    
    init(json: JSON) {        
        title = json["volumeInfo"]["title"].stringValue
                
        let authorsArray = json["volumeInfo"]["authors"].arrayValue
        authors = authorsArray.map { $0.stringValue }.joined(separator: ", ")
        
        publishedDate = json["volumeInfo"]["publishedDate"].stringValue

        description = json["volumeInfo"]["description"].stringValue

        thumbnailLink = json["volumeInfo"]["imageLinks"]["thumbnail"].stringValue

        webReaderLink = json["accessInfo"]["webReaderLink"].stringValue

        averageRating = json["volumeInfo"]["averageRating"].doubleValue
  
        ratingsCount = json["volumeInfo"]["ratingsCount"].intValue
    }
}

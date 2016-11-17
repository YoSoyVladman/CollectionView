//
//  Ciudad.swift
//  Collection
//
//  Created by Omar Vladimir Galicia Palmeros on 17/11/16.
//  Copyright © 2016 Poppler. All rights reserved.
//

import Foundation


class Ciudad {
    struct Keys {
        static let Titulo = "title"
        static let ImageUrl = "img"
        static let CiudadId = "city_id"
    }
    
    var title: String?
    var id: Int
    var imageUrl: String?
    
    init(dictionary : [String : AnyObject]) {
        self.title = dictionary[Keys.Titulo] as? String
        self.id = Int(dictionary[Keys.CiudadId] as! String)!
        self.imageUrl = dictionary[Keys.ImageUrl] as? String
    }
}

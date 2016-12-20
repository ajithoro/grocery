//
//  GridItem.swift
//  Grocery
//
//  Created by Unholy Saint on 19/12/16.
//  Copyright © 2016 Ajit Horo. All rights reserved.
//

import Foundation

class GridItem {
    
    var imageName: String?
    var name: String?
    
    init() {
        self.imageName = ""
        self.name = ""
    }
    
    init(imageName: String, name: String) {
        self.imageName = imageName
        self.name = name
    }
}

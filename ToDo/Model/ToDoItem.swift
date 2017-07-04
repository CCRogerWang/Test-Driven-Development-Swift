//
//  ToDoItem.swift
//  ToDo
//
//  Created by roger on 2017/6/22.
//  Copyright © 2017年 roger. All rights reserved.
//

import Foundation

func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
    return true
}

struct ToDoItem : Equatable {
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?
    init(title: String,
         itemDescription: String? = nil,
         timestamp: Double? = nil,
         location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
    
    
}


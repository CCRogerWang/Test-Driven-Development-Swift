//
//  Location.swift
//  ToDo
//
//  Created by roger on 2017/6/22.
//  Copyright © 2017年 roger. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

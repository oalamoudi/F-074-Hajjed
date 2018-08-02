//
//  Haji.swift
//  hajhacthon
//
//  Created by Marwan on 8/2/18.
//  Copyright © 2018 Marwan. All rights reserved.
//

import UIKit
import CoreLocation

class Haji: NSObject {
    
    var id = "0"
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D.init()
    var timestamp: Date?
    var nationality = ""
    var passportno = ""
    var name = ""
}

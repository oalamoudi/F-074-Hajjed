//
//  MentorMapViewController.swift
//  hajhacthon
//
//  Created by Marwan on 8/3/18.
//  Copyright © 2018 Marwan. All rights reserved.
//

import UIKit

class MentorMapViewController: MapViewController {

    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let haj = missed.first as! Haji
        name.text = haj.name
    }
}

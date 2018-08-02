//
//  MainViewController.swift
//  hajhacthon
//
//  Created by Marwan on 8/3/18.
//  Copyright © 2018 Marwan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToHajMode(_ sender: Any) {
        let mapViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Map1") as! MapViewController
        let haji1 = Haji.init()
        haji1.id = String.init(1)
        let lat1 = 21.28891
        let long1 = 39.8579;
        haji1.location.longitude = long1
        haji1.location.latitude = lat1
        haji1.name = "عمر سعيد أحمد"
        mapViewController.missed = [haji1]
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
}

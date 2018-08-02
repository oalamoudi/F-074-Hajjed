//
//  GroupListViewControllerTableViewController.swift
//  hajhacthon
//
//  Created by Marwan on 8/2/18.
//  Copyright © 2018 Marwan. All rights reserved.
//

import UIKit

typealias ShowMapClicked = () -> Void
class GroupCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var passportno: UILabel!
    @IBOutlet weak var nationality: UILabel!
    var showMapClicked: ShowMapClicked?
    @IBAction func showMap(_ sender: Any) {
        showMapClicked!()
    }
}
class GroupListViewControllerTableViewController: UITableViewController {
    var haijs = [Haji]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haijs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
        let haj = haijs[indexPath.row]
        cell?.name.text = haj.name
        cell?.nationality.text = haj.nationality
        cell?.passportno.text = haj.passportno
        cell?.showMapClicked = {
            let mapViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
            mapViewController.missed = [haj]
            self.navigationController?.pushViewController(mapViewController, animated: true)
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: view.frame.size.width - 30, height: 30))
        title.text = "مجموعة \(section)"
        title.textAlignment = NSTextAlignment.right
        title.backgroundColor = UIColor.white
        return title
    }
}

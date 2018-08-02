//
//  MotawafListTableViewController.swift
//  hajhacthon
//
//  Created by Marwan on 8/2/18.
//  Copyright © 2018 Marwan. All rights reserved.
//

import UIKit

class MotawafListTableViewController: UITableViewController {
    var motwaf = [Motwaf]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMotwafList()
    }

    //Mock data for now
    func loadMotwafList() {
        var i = 2
        let haji = Motwaf.init()
        haji.id = String.init(111)
        let lat = 21.58891 //+ (2.0*Double.init(i));
        let long = 39.8579;
        haji.location.longitude = long
        haji.location.latitude = lat
        haji.name = " محمد أحمد"
        motwaf.insert(haji, at: 0)
        
        let haji1 = Motwaf.init()
        haji1.id = String.init(1)
        let lat1 = 21.28891
        let long1 = 39.8579;
        haji1.location.longitude = long1
        haji1.location.latitude = lat1
        haji1.name = "عمر سعيد أحمد"
        motwaf.insert(haji1, at: 1)
        while i < 10 {
            let haji = Motwaf.init()
            haji.id = String.init(i)
            let lat = 21.3891
            let long = 39.8579;
            haji.location.longitude = long
            haji.location.latitude = lat
            haji.name = " محمد أحمد"
            motwaf.insert(haji, at: i)
            i = i + 1
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return motwaf.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
        let haj = motwaf[indexPath.row]
        cell?.name.text = haj.name
        cell?.nationality.text = "\(haj.numberofHajis)عدد الحجاج"
        cell?.showMapClicked = {
            let mapViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
            mapViewController.missed = [haj]//self.motwaf
            self.navigationController?.pushViewController(mapViewController, animated: true)
        }
        // Configure the cell...
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let homeViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as! HomeViewController
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

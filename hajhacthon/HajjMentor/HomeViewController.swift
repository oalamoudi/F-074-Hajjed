//
//  HomeViewController.swift
//  hajhacthon
//
//  Created by Marwan on 8/2/18.
//  Copyright © 2018 Marwan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    var missed = [Any]()
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHajisList()
        dropPins()
    }
    
    //Mock data for now
    func loadHajisList() {
        var i = 2
        let haji = Haji.init()
        haji.id = String.init(111)
        let lat = 21.58891 //+ (2.0*Double.init(i));
        let long = 39.8579;
        haji.location.longitude = long
        haji.location.latitude = lat
        haji.name = " محمد أحمد"
        haji.passportno = "رقم الجواز : A1248085"
        haji.nationality = "مصري"
        missed.insert(haji, at: 0)

        let haji1 = Haji.init()
        haji1.id = String.init(1)
        let lat1 = 21.28891
        let long1 = 39.8579;
        haji1.location.longitude = long1
        haji1.location.latitude = lat1
        haji1.name = "عمر سعيد أحمد"
        haji1.passportno = "رقم الجواز : A1248085"
        haji1.nationality = "سعودي"
        missed.insert(haji1, at: 1)
        while i < 10 {
            let haji = Haji.init()
            haji.id = String.init(i)
            let lat = 21.3891 
            let long = 39.8579;
            haji.location.longitude = long
            haji.location.latitude = lat
            haji.name = " محمد أحمد"
            haji.passportno = "رقم الجواز : A1248085"
            haji.nationality = "مصري"
            missed.insert(haji, at: i)
            i = i + 1
        }
    }
    
    @IBAction func showMissedOnMap(_ sender: Any) {
        let mapViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController 
        mapViewController.missed = missed
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        
        mapView.mapType = MKMapType.standard
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = ""
        annotation.subtitle = "current location"
        mapView.addAnnotation(annotation)
        
        //centerMap(locValue)
    }
    
    
    func dropPins(){
        var i = 0
        var coord = CLLocationCoordinate2D()
        while i < self.missed.count {
            let haji: Haji = self.missed[i] as! Haji
            let lat = haji.location.latitude
            let long = haji.location.longitude
            coord.latitude = lat
            coord.longitude = long
            let locationq:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
            let annotation = MKPointAnnotation()
            annotation.coordinate = locationq

            self.mapView.addAnnotation(annotation)
            i = i + 1
        }
        var region = MKCoordinateRegion()
        region.center=coord;
        region.span.longitudeDelta=1 ;
        region.span.latitudeDelta=1;
        self.mapView.setRegion(region, animated: true)
    }
    
    @IBAction func showGroups(_ sender: Any) {
        let mapViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GroupViewController") as! GroupListViewControllerTableViewController
        mapViewController.haijs = missed as! [Haji]
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
    
}

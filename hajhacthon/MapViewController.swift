//
//  MapViewController.swift
//  hajhacthon
//
//  Created by Marwan on 8/2/18.
//  Copyright © 2018 Marwan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    let locationManager = CLLocationManager()
    var missed = [Any]()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
        dropPins()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let location = CLLocationCoordinate2DMake(21.422510, 39.826168)
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
//            let location = self.workLocationArray.objectAtIndex(i).valueForKey("client") as! String
//            let title = self.workLocationArray.objectAtIndex(i).valueForKey("job") as! String
            coord.latitude = lat
            coord.longitude = long
            let locationq:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
            let annotation = MKPointAnnotation()
            annotation.coordinate = locationq
            //annotation.title = title
            //annotation.subtitle = location
            self.mapView.addAnnotation(annotation)
            i = i + 1
        }
        var region = MKCoordinateRegion()
        region.center=coord;
        region.span.longitudeDelta=1 ;
        region.span.latitudeDelta=1;
        self.mapView.setRegion(region, animated: true)
    }

}

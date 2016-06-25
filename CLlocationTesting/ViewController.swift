//
//  ViewController.swift
//  CLlocationTesting
//
//  Created by Blair Altland on 6/12/16.
//  Copyright © 2016 Blairaltland. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //Labels
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    
    //Variables
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
    }
    
    func locationManager( _ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations[0] as CLLocation! {
            
            altitudeLabel.text = String(location.altitude)
            latitudeLabel.text = String(location.coordinate.latitude)
            longitudeLabel.text = String(location.coordinate.longitude)
            
            if startLocation == nil {
                startLocation = location as CLLocation
            }
            
        }
    }


}


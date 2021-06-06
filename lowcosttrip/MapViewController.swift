//
//  MapViewController.swift
//  lowcosttrip
//
//  Created by Admin on 28.05.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
        for airp in airports {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: airp.lat, longitude: airp.long)
            annotation.title = airp.name
            annotation.subtitle = airp.shortname
            mapView.addAnnotation(annotation)
        }
    }
    
    func checkLocationEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            setupManager()
            checkAuthorization()
        } else {
            showAlerts(title: "Your location service disabled", message: "Do you want enable it?", url: URL(string:"App-Prefs:root=LOCATION_SERVICES"))
        }
}
    
    func checkAuthorization(){
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            showAlerts(title: "You denied using location", message: "Do you want to change it?", url: URL(string: UIApplication.openSettingsURLString))
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        @unknown default:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        }
    }
    
    func showAlerts(title:String, message:String?, url:URL?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alert) in
            if let url = url {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }

    func setupManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

}
extension MapViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]){
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000000, longitudinalMeters: 5000000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorization()
    }
    
}

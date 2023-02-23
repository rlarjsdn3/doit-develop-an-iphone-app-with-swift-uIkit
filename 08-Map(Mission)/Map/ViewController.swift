//
//  ViewController.swift
//  Map
//
//  Created by 김건우 on 2023/02/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubTitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last!
        _ = goLocation(latitudeValue: pLocation.coordinate.latitude, longitudeValue: pLocation.coordinate.longitude, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation) { (placemark, error) -> Void in
            let pm = placemark!.first
            let country = pm!.country
            var address: String = country!
            if let locality = pm!.locality {
                address += " "
                address += locality
            }
            if let thoroughfare = pm!.thoroughfare {
                address += " "
                address += thoroughfare
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        }
        
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        case 1:
            setAnnotation(latitudeValue:  36.95062739238709, longitudeValue: 127.90803622731468, delta: 0.01, title: "건국대학교(글로컬)", subtitle: "충청북도 충주시 충원대로 268")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "건국대학교 글로컬캠퍼스"
        case 2:
            setAnnotation(latitudeValue:  37.556876, longitudeValue: 126.914066, delta: 0.01, title: "이지스퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스 퍼블리싱"
        default:
            setAnnotation(latitudeValue: 37.51582689606972, longitudeValue: 126.84156197328005 , delta: 0.01, title: "우리집", subtitle: "서울시 양천구 남부순환로 83길 18")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "목동센트럴아이파크위브 2단지"
        }
    }
}


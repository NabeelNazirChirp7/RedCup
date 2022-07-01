//
//  LocationPermissionViewController.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import UIKit
import CoreLocation

class LocationPermissionViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var useMyLocationBtn: UIButton!

    // MARK: - Constants and variables
    private var locationManager = CLLocationManager()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        useMyLocationBtn.addGradientLayer(colors: [
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
            UIColor.primaryRed?.cgColor ?? UIColor.red.cgColor,
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
        ])
    }
    
    // MARK: - UIActions
    @IBAction func didTapBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapUseMyLocationBtn(_ sender: Any) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationPermissionViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        locationManager.stopUpdatingLocation()
        
        if let vc: InCollegeViewController = UIStoryboard.initiateViewController(storyboard: .setupAccount) {
            navigationController?.pushViewController(vc, animated: false)
        }
    }
}

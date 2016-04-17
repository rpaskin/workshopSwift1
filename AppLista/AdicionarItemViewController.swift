//
//  ViewController.swift
//  AppLista
//
//  Created by ORT1 on 4/16/16.
//  Copyright © 2016 ORT. All rights reserved.
//

import UIKit
import CoreLocation

class AdicionarItemViewController: UIViewController, CLLocationManagerDelegate {

    var newItem: String?
    
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    @IBOutlet weak var newItemText: UITextField!

    var locationManager: CLLocationManager!

    var locationName: String?
    var lat: Double!
    var lng: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        locationManager.delegate = self
    }

    override func viewDidAppear(animated: Bool) {
        locationManager.startUpdatingLocation()
    }
    
    override func viewDidDisappear(animated: Bool) {
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func touchDone(sender: AnyObject) {

        if let text = newItemText.text where !text.isEmpty {

            // performSegueWithIdentifier("listToAddToList", sender: nil)

            newItem = text
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        doneBtn.enabled = true
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lc = manager.location else { return }

        lat = lc.coordinate.latitude
        lng = lc.coordinate.longitude

//        print(lat)
//        print(lng)
        
        CLGeocoder().reverseGeocodeLocation(lc) { (placemarks, err) in
            
            if let pm = placemarks where pm.count > 0 {
                self.locationName = pm[0].addressDictionary!["City"] as? String

//                print(self.currentLocation)
//                print(pm[0].addressDictionary!)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let btn = sender as? UIBarButtonItem where btn == doneBtn else {
            return
        }
        if let text = newItemText.text where !text.isEmpty {
            newItem = text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


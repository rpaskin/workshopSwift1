//
//  ViewController.swift
//  AppLista
//
//  Created by ORT1 on 4/16/16.
//  Copyright © 2016 ORT. All rights reserved.
//

import UIKit
import CoreLocation

class AdicionarItemViewController: UIViewController, UITextFieldDelegate {

    var newItem: String?
    
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    @IBOutlet weak var newItemText: UITextField!
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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


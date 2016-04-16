//
//  ViewController.swift
//  AppLista
//
//  Created by ORT1 on 4/16/16.
//  Copyright © 2016 ORT. All rights reserved.
//

import UIKit

class AdicionarItemViewController: UIViewController {

    var newItem: String?
    
    @IBOutlet weak var doneBtn: UIBarButtonItem!

    @IBOutlet weak var newItemText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let botao = sender as? UIBarButtonItem where botao == doneButton else {
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


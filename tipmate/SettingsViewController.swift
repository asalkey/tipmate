//
//  SettingsViewController.swift
//  tipmate
//
//  Created by Andy on 8/7/17.
//  Copyright © 2017 Andy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipthreeField: UITextField!
    @IBOutlet weak var tiptwoField: UITextField!
    @IBOutlet weak var tiponeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveSettings(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tiponeField.text!, forKey: "tipone")
        defaults.set(tiptwoField.text!, forKey: "tiptwo")
        defaults.set(tipthreeField.text!, forKey: "tipthree")
        defaults.synchronize()
    }

}

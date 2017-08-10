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
        defaultSettings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func defaultSettings(){
        let defaults = UserDefaults.standard
        let tipone = (defaults.object(forKey: "tipone") != nil) ? defaults.object(forKey: "tipone") as! String : "5";
        let tiptwo = (defaults.object(forKey: "tiptwo") != nil) ? defaults.object(forKey: "tiptwo") as! String : "10"
        let tipthree = (defaults.object(forKey: "tipthree") != nil) ? defaults.object(forKey: "tipthree") as! String : "15"
        
        tiponeField.text =  tipone
        tiptwoField.text =  tiptwo
        tipthreeField.text = tipthree
    }
    
    @IBAction func saveSettings(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tiponeField.text!, forKey: "tipone")
        defaults.set(tiptwoField.text!, forKey: "tiptwo")
        defaults.set(tipthreeField.text!, forKey: "tipthree")
        defaults.synchronize()
    }

}

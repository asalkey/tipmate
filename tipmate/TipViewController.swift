//
//  TipViewController.swift
//  tipmate
//
//  Created by Andy on 8/7/17.
//  Copyright © 2017 Andy. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        savedSettings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18,0.2,0.25]
        let bill  = Double(billField.text!) ?? 0
        let tip   = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill * tip
        
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        savedSettings()
    }
    
    func savedSettings(){
        let defaults = UserDefaults.standard
        let tipone = (defaults.object(forKey: "tipone") != nil) ? defaults.object(forKey: "tipone") as! String + "%" : "5%";
        let tiptwo = (defaults.object(forKey: "tiptwo") != nil) ? defaults.object(forKey: "tiptwo") as! String + "%": "10%"
        let tipthree = (defaults.object(forKey: "tipthree") != nil) ? defaults.object(forKey: "tipthree") as! String + "%" : "15%"
        
        
        tipControl.setTitle(tipone, forSegmentAt: 0)
        tipControl.setTitle(tiptwo, forSegmentAt: 1)
        tipControl.setTitle(tipthree, forSegmentAt: 2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
}


//
//  ViewController.swift
//  tips
//
//  Created by Esteban Solis on 12/20/15.
//  Copyright © 2015 Esteban Solis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var underBillField: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        tipView.alpha = 0
        billField.becomeFirstResponder()
        billField.center = CGPoint(x: self.billField.center.x, y:CGFloat(180))
        underBillField.center = CGPoint(x: self.underBillField.center.x, y: CGFloat(180))
        tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(550))
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {

        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if(billField.text != "") {
            UIView.animateWithDuration(0.3, animations: {
                self.tipView.alpha = 1
                self.tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(420))
                self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(110))
                
            })
        } else {
            UIView.animateWithDuration(0.3, animations: {
                self.tipView.alpha = 0
                self.tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(550))
                self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(180))
            })
        }
       
    }

    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


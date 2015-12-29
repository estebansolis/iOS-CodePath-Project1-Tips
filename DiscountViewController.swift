//
//  DiscountViewController.swift
//  tips
//
//  Created by Esteban Solis on 12/20/15.
//  Copyright © 2015 Esteban Solis. All rights reserved.
//

import UIKit

class DiscountViewController: UIViewController {
  
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var discountField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Discount Calculator"
        totalLabel.text = "$0.00"
        tipView.alpha = 0
        tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(550))
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var price = NSString(string: priceField.text!).doubleValue
        var discount = (NSString(string: discountField.text!).doubleValue)/100
        var solution = price * discount
        var total = price - solution
    
        totalLabel.text = String(format: "$%.2f", total)
        
        if(priceField.text != "") {
            UIView.animateWithDuration(0.3, animations: {
                self.tipView.alpha = 1
                self.tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(420))
                
            })
        } else {
            UIView.animateWithDuration(0.3, animations: {
                self.tipView.alpha = 0
                self.tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(550))
          
              
            })
        }
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

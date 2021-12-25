//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sheryl Seeyave on 12/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControlSlide: UISlider!
    @IBOutlet weak var partyTotal: UILabel!
    @IBOutlet weak var partySizeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get custom tip from control slide
        let customPercentage = Double(Int(tipControlSlide.value))/100
        
        // Get total tip by multiplying tip * percentage
        let tipPercentages = [0.15, 0.18, 0.20, customPercentage]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update control slide value
        tipControlSlide.setValue(Float(tipPercentages[tipControl.selectedSegmentIndex]) * 100, animated: true)
        
        // Update custom segment title
        if(tipControl.selectedSegmentIndex == 3) {
            tipControl.setTitle(String(format: "%.0f%%", tipControlSlide.value), forSegmentAt: 3)
        }
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Get party size
        let partySize = Int(partySizeTextField.text!) ?? 1
        if(partySize > 1) {
            partyTotal.text = "Each Party Total"
            totalLabel.text = String(format: "$%.2f", total/Double(partySize))
        }
        else {
            // Update total Amount
            partyTotal.text = "Total"
            totalLabel.text = String(format: "$%.2f", total)
        }
    }
    
    @IBAction func calculateTipSlide(_ sender: Any) {
        tipControl.setTitle(String(format: "%.0f%%", tipControlSlide.value), forSegmentAt: 3)
        calculateTip(self)
    }
    
}


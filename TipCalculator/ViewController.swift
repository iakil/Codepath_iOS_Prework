//
//  ViewController.swift
//  TipCalculator
//
//  Created by Akil Bhuiyan on 8/24/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitControl: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageShow: UILabel!
    @IBOutlet weak var tipSliderLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    
    }
    
    var numPpl = 1
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        numPpl = Int(sender.value)
    }


    @IBAction func sliderCalc( sender: Int)
        {
        billAmountTextField.endEditing(true)
        let tipFrmSlide = sender/100
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * Double(tipFrmSlide)
        let total = (bill + tip) / Double(numPpl)
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        billLabel.text = String(format:"$%.2f", Float(bill))
    }

    @IBAction func calculateTip(_ sender: Any)
        {
        billAmountTextField.endEditing(true)
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip) / Double(numPpl)
            
        tipPercentageShow.text = "Tip  (\(Int(tipPercentages[tipControl.selectedSegmentIndex]*100))%)"
        
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        billLabel.text = String(format:"$%.2f", Float(bill))
    }

    
    @IBAction func tipSliderValFunc(_ sender: UISlider)
        {
         
            let val = Int(sender.value)
            tipSliderLabel.text = "\(val)%"
            tipPercentageShow.text = "Tip  (\(val)%)"
            let tipFrmSlide = Double(val)/100.00
            let bill = Double(billAmountTextField.text!) ?? 0
            let tip = bill * Double(tipFrmSlide)
            let total = (bill + tip) / Double(numPpl)
            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            billLabel.text = String(format:"$%.2f", Float(bill))
        }
    

}
 


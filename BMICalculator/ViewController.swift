//
//  ViewController.swift
//  BMICalculator
//
//  Created by user on 2/22/17.
//  Copyright © 2017 Tevisophea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //CATEGORY & RANGE LABEL
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    //DISPLAY IMAGE
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var createdBy: UIImageView!
    
    //TEXTFIELD TO READ USER INPUT
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    
    //MAKE SURE SWITCH IS ON
    @IBOutlet weak var errorMsg: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        createdBy.image = UIImage(named: "sign")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //MARK: ACTIONS
    
    //SWITCH FUNCTIONS TO CONVERT THE UNITS TO METRIC
    @IBAction func metricUnit(_ sender: UISwitch) {
        
        let height = Float(self.heightTF.text!)!
        let weight = Float(self.weightTF.text!)!
        
        if sender.isOn {
            let MUHeight = height * 0.0254
            let MUWeight = weight * 0.4536
            heightTF.text = String(MUHeight)
            weightTF.text = String(MUWeight)
        }
        else {
            errorLabel.text = "Must Convert to Metric Unit!"
            let newHeight = height / 0.0254
            let newWeight = weight / 0.4536
            heightTF.text = String(newHeight)
            weightTF.text = String(newWeight)
        }
    }
    
    
    //CALC FUNCTION TO DETERMINE USER'S BMI,CATEGORY, & RANGE
    @IBAction func calc(_ sender: UIButton) {
      
        let height = Float(self.heightTF.text!)!
        let weight = Float(self.weightTF.text!)!
        
        //CALCULATE USER'S BMI
        let heightSQ = height * height
        let BMI:Float = weight / heightSQ
        
        //CHECK USER'S CATERGORY & RANGE BASED ON BMI
        //DISPLAY IMAGE THAT CORRELATE
        if (BMI < 16.00) {
            numberLabel.text = String(BMI)
            rangeLabel.text = "Severe Thinness"
            imageUser.image = UIImage(named: "1")
        }
        else if ((BMI > 16.00) && (BMI < 16.99)) {
            numberLabel.text = String(BMI)
            rangeLabel.text = "Moderate Thinness"
            imageUser.image = UIImage(named: "2")
        }
        else if ((BMI > 17.00) && (BMI < 18.49)) {
            numberLabel.text = String(BMI)
            rangeLabel.text = "Mild Thinness"
            imageUser.image = UIImage(named: "3")
        }
        else if ((BMI > 18.50) && (BMI < 24.99)) {
            numberLabel.text = String(BMI)
            rangeLabel.text = "Normal Range"
            imageUser.image = UIImage(named: "4")
        }
        else if ((BMI > 25.00) && (BMI < 29.99)) {
            numberLabel.text = String(BMI)
            rangeLabel.text = "Overweight"
            imageUser.image = UIImage(named: "5")
        }
        else if ((BMI > 30.00) && (BMI < 34.99)) {
            numberLabel.text = String(BMI)
            rangeLabel.text = "Obese Class I"
            imageUser.image = UIImage(named: "6")
        }
        else if ((BMI > 35.00) && (BMI < 39.99)) {
            numberLabel.text = String(BMI)
            rangeLabel.text = "Obese Class II"
            imageUser.image = UIImage(named: "7")
        }
        else if (BMI > 39.99) {
            numberLabel.text = String(BMI)
            rangeLabel.text = "Obese Class III"
            imageUser.image = UIImage(named: "8")
        }
        
    }


}


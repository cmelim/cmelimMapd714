//
//  ViewController.swift
//  CamiloMeli_MAPD714_Assign1
//
//  Created by Camilo Meli on 2023-09-22.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var inputPrincipal: UITextField!
    
    @IBOutlet weak var inputTime: UITextField!
    
    @IBOutlet weak var inputRateOfInterest: UITextField!

    @IBOutlet weak var outInterest: UILabel!
    @IBOutlet weak var outTotal: UILabel!
    
    @IBOutlet weak var btnClear: UIButton!
    
    @IBOutlet weak var btnCalcular: UIButton!
    
    let numberFormatter = NumberFormatter()
    
    let principalMessage        = NSLocalizedString("Principal is required.", comment: "")
    let timeMessage         = NSLocalizedString("Time is required.", comment: "")
    let rateMessage            = NSLocalizedString("Rate of interest is required.", comment: "")
    
    var textFieldArray:[UITextField] = []
    
    override func viewDidLoad() {
        
        //inputPrincipal.keyboardType = .numberPad
        //inputTime.keyboardType = .numberPad
        //inputRateOfInterest.keyboardType = .numberPad
        modifiTextoTextField(inputPrincipal)
        modifiTextoTextField(inputTime)
        modifiTextoTextField(inputRateOfInterest)
       
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    ///
    /// Get value from inputPrincipal, inputTime and inputRateOfInterest
    ///
    @IBAction func calculate(_ sender: Any) {
    
            
        if let principalText = inputPrincipal.text, let rateText = inputRateOfInterest.text, let timeText = inputTime.text, let principal = Float(principalText), let rate = Float(rateText), let timeNumeber = Float(timeText) {
            
            
            // /APPLY  (P × R × T)/100
            let principalInt = (principal * rate * timeNumeber) / 100
            
            // SHOW INTERES in UI
            outInterest.text = String(principalInt);
            //SUM INTERES + PRINCIPAL and show in UI
            outTotal.text = String(principalInt + principal);
        } else {
            //Handles the case where the text conversion is not a numeric value
            
            displayAlert()
            
        }
        
        
    }
    
    //FUNCRION TO DISPLAY PROBLEM IN INPUT
    func displayAlert()
    {
      let alert=UIAlertController(title: "Error", message: "Only Numbers", preferredStyle: .alert)

      alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: {action in
          print("Process is over")
       }))
      present(alert, animated: true)
    }
    
    // FUNCRION TO CLEAR ALL INPUT AND TEXT VALUES
    @IBAction func clear(_ sender: Any) {
        inputTime.text = "";
        inputPrincipal.text = "";
        inputRateOfInterest.text = "";
        
        outInterest.text = "";
        outTotal.text = "";
        inputPrincipal.becomeFirstResponder()

        
    }
    //recibe un objeto de tipo UITextField para personalizarlos
    //@INPUT UITextField
    
    func modifiTextoTextField(_ textField: UITextField) {
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 1
        numberFormatter.maximumFractionDigits = 1
        
        // Configura el campo de entrada de texto para usar el formato personalizado
        textField.text = numberFormatter.string(from: NSNumber(value: 0.0))
    }
}
/*
extension ViewController{

    
    func validateData() -> Bool {
        
        guard !principalMessage.text!.isEmptyStr else {
            principalMessage.showError(message: principalMessage)
            return false
        }
        
        guard !inputTime.text!.isEmptyStr else {
            inputTime.showError(message: timeMessage)
            return false
        }
        
        guard !inputRateOfInterest.text!.isEmptyStr else {
            inputRateOfInterest.showError(message: rateMessage)
            return false
        }
        
        return true
    }
}
 */


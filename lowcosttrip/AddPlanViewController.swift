//
//  AddPlanViewController.swift
//  lowcosttrip
//
//  Created by Anatoly Bardukov on 06/06/2021.
//

import UIKit

class AddPlanViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var from: UITextField!
    @IBOutlet var to: UITextField!
    @IBOutlet var flight: UITextField!
    @IBOutlet var flightDate: UIDatePicker!
    @IBOutlet var exposeSelf: UIButton!
    
    var update: (() -> Void)?
    
    var expose: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        from.delegate = self
        to.delegate = self
        flight.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(savePlan))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        savePlan()
        return true
    }
    
    @IBAction func toggleExpose() {
        if expose {
            exposeSelf.setTitle("Hidden", for: .normal)
            expose = false
        } else {
            exposeSelf.setTitle("Exposed", for: .normal)
            expose = true
        }
    }
    
    @objc func savePlan() {
        
        guard let fromValue = from.text, !fromValue.isEmpty else {
            from.layer.borderColor = UIColor.red.cgColor
            from.layer.borderWidth = 1.0
            print("from_value")
            return
        }
        from.layer.borderColor = UIColor.black.cgColor
        
        guard let toValue = to.text, !toValue.isEmpty else {
            to.layer.borderColor = UIColor.red.cgColor
            to.layer.borderWidth = 1.0
            print("to_value")
            return
        }
        to.layer.borderColor = UIColor.black.cgColor
        
        guard let flightValue = flight.text, !flightValue.isEmpty else {
            flight.layer.borderColor = UIColor.red.cgColor
            flight.layer.borderWidth = 1.0
            print("flight")
            return
        }
        flight.layer.borderColor = UIColor.black.cgColor
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            print("count")
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        
        do {
            let encodedData = try NSKeyedArchiver.archivedData(
                withRootObject: Plan(from: fromValue, to: toValue, flight: flightValue, exposeMyself: self.expose),
                requiringSecureCoding: false
            )
            UserDefaults().set(
                encodedData,
                forKey: "plan_\(newCount)"
            )
        } catch {
            print("archiving")
            return
        }
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
    
}

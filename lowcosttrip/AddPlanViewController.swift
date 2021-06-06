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
    
    @objc func savePlan() {
        
        guard let fromValue = from.text, !fromValue.isEmpty else {
            print("from_value")
            return
        }
        guard let toValue = to.text, !toValue.isEmpty else {
            print("to_value")
            return
        }
        guard let flightValue = flight.text, !flightValue.isEmpty else {
            print("flight")
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            print("count")
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        
        do {
            let encodedData = try NSKeyedArchiver.archivedData(
                withRootObject: Plan(from: fromValue, to: toValue, flight: flightValue, exposeMyself: true),
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

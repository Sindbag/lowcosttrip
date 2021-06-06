//
//  PlanViewController.swift
//  lowcosttrip
//
//  Created by Anatoly Bardukov on 06/06/2021.
//

import UIKit

class PlanViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var from: UILabel!
    @IBOutlet var to: UILabel!
    @IBOutlet var toButton: UIButton!
    @IBOutlet var fromButtom: UIButton!
    
    var plan: Plan?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = plan?.flight
        from.text = plan?.from
        to.text = plan?.to
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Expose", style: .done, target: self, action: #selector(exposeSelf))
    }
    
    @objc func exposeSelf() {
        // TODO: add function to trigger exposure
    }
    
    func getFiltered(filter: String) -> [Airport] {
        let filteredAirports = airports.filter({ (airport: Airport) -> Bool in
            return (airport.name.lowercased().contains(filter.lowercased()) || airport.shortname.lowercased().contains(filter.lowercased()) )
        })
        return filteredAirports
    }
    
    @IBAction func goToFrom() {
        if (plan != nil) {
            let filteredFrom = getFiltered(filter: plan!.from)
            if filteredFrom.count > 0 {
                let vc = storyboard?.instantiateViewController(identifier: "airport") as! DetailViewController
                vc.title = filteredFrom.first!.name
                vc.airport = filteredFrom.first!
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func goToTo() {
        if (plan != nil) {
            let filteredFrom = getFiltered(filter: plan!.to)
            if filteredFrom.count > 0 {
                let vc = storyboard?.instantiateViewController(identifier: "airport") as! DetailViewController
                vc.title = filteredFrom.first!.name
                vc.airport = filteredFrom.first!
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}

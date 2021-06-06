//
//  PlansTableViewController.swift
//  lowcosttrip
//
//  Created by Admin on 30.05.2021.
//

import UIKit

class PlansTableViewController: UITableViewController {

    var plans = [Plan]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Plans"
        tableView.delegate = self
        tableView.dataSource = self
        
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        updateTasks()
    }
    
    func updateTasks() {
        
        plans.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            
            guard let decoded  = UserDefaults().object(forKey: "plan_\(x + 1)") as? Data else {
                continue
            }
            
            do {
                let decodedPlan = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as! Plan
                plans.append(decodedPlan)
            } catch {
                continue
            }
            
        }
        
        tableView.reloadData()
    }
    
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! AddPlanViewController
        vc.title = "New Plan"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "plan") as! PlanViewController
        vc.title = plans[indexPath.row].flight
        vc.plan = plans[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let plan = plans[indexPath.row]

        cell.textLabel?.text = plan.from + "-" + plan.to
        cell.detailTextLabel?.text = plan.flight

        return cell
    }
}

//
//  DetailViewController.swift
//  lowcosttrip
//
//  Created by Admin on 30.05.2021.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var airport: Airport?
    
    @IBOutlet weak var RouteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = airport?.name
        if airport != nil {
            RouteLabel.text = "Чтобы добраться из \(airport!.name) воспользуйтесь одним из вариантов"
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return airport?.route?.count ?? 0
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = airport?.route?[indexPath.row] ?? "Unknown"
        
        return cell
    }
}

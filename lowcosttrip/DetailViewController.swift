//
//  DetailViewController.swift
//  lowcosttrip
//
//  Created by Admin on 30.05.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var airport: Airport!

    @IBOutlet var airportImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = airport.name
//        airportImage.image = UIImage(named: airport.name)
    }
}

//
//  AirportListViewController.swift
//  lowcosttrip
//
//  Created by Admin on 30.05.2021.
//

import UIKit

class AirportListViewController: UITableViewController {

    var filteredAirports = [Airport]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredAirports.count
        }
        return airports.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var airport: Airport
        
        if isFiltering {
            airport = filteredAirports[indexPath.row]
        } else {
            airport = airports[indexPath.row]
        }

        cell.textLabel?.text = airport.name
        cell.detailTextLabel?.text = airport.shortname

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let airport: Airport
                if isFiltering {
                    airport = filteredAirports[indexPath.row]
                } else {
                    airport = airports[indexPath.row]
                }
                let detailVC = segue.destination as! DetailViewController
                detailVC.airport = airport
            }
        }
    }

}

// MARK: - UISearchResultsUpdating Delegate
extension AirportListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredAirports = airports.filter({ (airport: Airport) -> Bool in
            return (airport.name.lowercased().contains(searchText.lowercased()) || airport.shortname.lowercased().contains(searchText.lowercased()) )
        })
        
        tableView.reloadData()
    }
}

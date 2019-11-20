//
//  StateDetailTableViewController.swift
//  Representative.
//
//  Created by Anthony Torres on 11/20/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var representative: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var state: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = state
        if let state = state {
            RepresentativeController.searchRepresentatives(forState: state) { (repArray) in
                self.representative = repArray
                DispatchQueue.main.async {
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return representative.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }
        
        cell.representative = representative[indexPath.row]
        
        return cell
    }
}

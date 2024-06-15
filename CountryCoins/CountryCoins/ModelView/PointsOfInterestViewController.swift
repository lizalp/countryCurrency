//
//  PointsOfInterestViewController.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 15/06/24.
//

import UIKit

class PointsOfInterestViewController: UITableViewController {
    var pointsOfInterest = [PointOfInterest]()
    var pais: String!
    var state: String!
    
    private var dataSource: UITableViewDiffableDataSource<Int,String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupDataSource()
        updateSnapshot(with: pointsOfInterestToSring())
    }
    
    private func setupDataSource() {
        // configuring cell with diffable data source
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        
        // configure cell update
        dataSource = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, pointOfInterest in
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
            cell.textLabel?.text = pointOfInterest
            return cell
        }
    }
    
    // updating the diffable with new data
    func updateSnapshot(with data: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(data) // Adding more items
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func pointsOfInterestToSring() -> [String] {
        if let p = pointsOfInterest.first(where: { pointOfInterest in
            pointOfInterest.pais == pais
        }) {
            if let m = p.points.first(where: { city in
                city.estado == state
            }) {
                return m.lugares
            }
            return []
        }
        return []
    }
}

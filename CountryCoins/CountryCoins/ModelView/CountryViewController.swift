//
//  ViewController.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import UIKit

class CountryViewController: UIViewController {
    //para no exponer propiedades de clase
    var appStorage: AppStorage!
    private var countryCollectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Int,Flag>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupCollectionView()
        configureUI()
        countryCollectionView.delegate = self
        appStorage.fetchFlags()
        setupDataSource()
        updateSnapshot(with: appStorage.flags)
    }
    
    private func setupDataSource() {
        // configuring cell with diffable data source
        countryCollectionView.register(FlagCollectionCell.self, forCellWithReuseIdentifier: FlagCollectionCell.cell)
        
        // configure cell update
        dataSource = UICollectionViewDiffableDataSource(collectionView: countryCollectionView) { collectionView, indexPath, flag in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlagCollectionCell.cell, for: indexPath) as? FlagCollectionCell else { fatalError("Unable to dequeue CustomCollectionCell") }
            cell.update(with: flag)
            return cell
        }
    }
    
    // updating the diffable with new data
    func updateSnapshot(with data: [Flag]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Flag>()
        snapshot.appendSections([0])
        snapshot.appendItems(data) // Adding more items
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    
    func setupCollectionView() {
        //create layout
        let layout = UICollectionViewFlowLayout()
        // Rectangulo de cada celda
        layout.itemSize = CGSize(width: 150, height: 100)
        //ppadding del elemento
        layout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 15)
        layout.minimumInteritemSpacing = 25.0
        layout.scrollDirection = .vertical
        
        countryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
    }
    
    func configureUI() {
        view.addSubview(countryCollectionView)
        
        countryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countryCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            countryCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            countryCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    


}

extension CountryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(CountryDetailViewController(), animated: true)
            print("Selected item at \(indexPath)")
        }
}

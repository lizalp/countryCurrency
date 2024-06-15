//
//  CountryDetailViewController.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import UIKit

class CountryDetailViewController: UIViewController  {
    var countryDetail: CountryDetail!
    var capital: Capital!
    //var currency: CurrencyElement!
    var appStorage: AppStorage!
    var index: Int!
    
    private var dataSource: UITableViewDiffableDataSource<Int,String>!
    
    private lazy var flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var capitalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var currencyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var statesTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupDataSource()
        configureUI()
        appStorage.fetchCountriesDetails()
        appStorage.fetchFlags()
        appStorage.fetchCapitals()
        appStorage.fetchPointsOfInterest()
        self.title = countryDetail.nombre
        //update(with: countryDetail)
        setupViews()
        updateSnapshot(with: capitalsToStrings())
    }
    
    private func setupDataSource() {
        // configuring cell with diffable data source
        statesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        
        // configure cell update
        dataSource = UITableViewDiffableDataSource(tableView: statesTableView) { tableView, indexPath, state in
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
            cell.textLabel?.text = state
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
    
    func capitalsToStrings() -> [String] {
        if let s = appStorage.capitals.first(where: { capital in
            capital.name == countryDetail.nombre
        }) {
            return s.estados
        }
        return []
    }
    
    private func setupViews() {
        flagImageView.image = UIImage(named: appStorage.flags[index].flagName)
        flagImageView.contentMode = .scaleAspectFit
        view.addSubview(flagImageView)
        
        capitalLabel.text = "Capital: \(countryDetail.capital)"
        view.addSubview(capitalLabel)
        
        languageLabel.text = "Language: \(countryDetail.idioma)"
        view.addSubview(languageLabel)
        
//        currencyButton.setTitle("Currency: \(currency.nombre)", for: .normal)
//        currencyButton.setTitleColor(.systemBlue, for: .normal)
//        currencyButton.addTarget(self, action: #selector(currencyButtonTapped), for: .touchUpInside)
//        view.addSubview(currencyButton)
        
//        statesTableView.delegate = self
//        statesTableView.dataSource = self
//        statesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "StateCell")
//        view.addSubview(statesTableView)
//        @objc private func currencyButtonTapped() {
//                let currencyVC = CurrencyViewController()
//                currencyVC.currency = country.currency
//                navigationController?.pushViewController(currencyConversionVC, animated: true)
//            }
       }
    
    func configureUI() {
        view.addSubview(flagImageView)
        view.addSubview(capitalLabel)
        view.addSubview(languageLabel)
        view.addSubview(statesTableView)
        
        NSLayoutConstraint.activate([
            
            capitalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            capitalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            capitalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            languageLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 20),
            languageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            languageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            flagImageView.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 20),
            flagImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            flagImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            flagImageView.heightAnchor.constraint(equalToConstant: 100),
            
            statesTableView.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 20),
            statesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            statesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            

        ])
    }
}

extension CountryDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = PointsOfInterestViewController()
        viewController.pais = countryDetail.nombre
        viewController.state = countryDetail.capital
        viewController.pointsOfInterest = appStorage.pointsOfInterest
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

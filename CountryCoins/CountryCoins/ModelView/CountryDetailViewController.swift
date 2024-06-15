//
//  CountryDetailViewController.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import UIKit

class CountryDetailViewController: UIViewController {
    var countryDetail: CountryDetail!
    var capital: Capital!
    var currency: CurrencyElement!
    var appStorage: AppStorage!
    
    private let flagImageView = UIImageView()
    
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
    
    private let statesTableView = UITableView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        appStorage.fetchCountriesDetails()
        self.title = countryDetail.nombre
        //update(with: countryDetail)
        setupViews()
    }
    
//    func update(with data: CountryDetail) {
//        languageLabel.text = data.idioma
//        capitalLabel.text = data.capital
//    }
    
    private func setupViews() {
//        flagImageView.image = country.flag
//        flagImageView.contentMode = .scaleAspectFit
//        view.addSubview(flagImageView)
        
        capitalLabel.text = "Capital: \(countryDetail.capital)"
        view.addSubview(capitalLabel)
        
        languageLabel.text = "Language: \(countryDetail.idioma)"
        view.addSubview(languageLabel)
        
        currencyButton.setTitle("Currency: \(currency.nombre)", for: .normal)
        currencyButton.setTitleColor(.systemBlue, for: .normal)
        currencyButton.addTarget(self, action: #selector(currencyButtonTapped), for: .touchUpInside)
        view.addSubview(currencyButton)
        
//        statesTableView.delegate = self
//        statesTableView.dataSource = self
//        statesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "StateCell")
//        view.addSubview(statesTableView)
        @objc private func currencyButtonTapped() {
                let currencyVC = CurrencyViewController()
                currencyVC.currency = country.currency
                navigationController?.pushViewController(currencyConversionVC, animated: true)
            }
       }
    
    func configureUI() {
        view.addSubview(flagImageView)
        view.addSubview(capitalLabel)
        view.addSubview(languageLabel)
        
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 200),
            flagImageView.heightAnchor.constraint(equalToConstant: 120),
            
            capitalLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 20),
            capitalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            capitalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            languageLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 20),
            languageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            languageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)

        ])
    }
}

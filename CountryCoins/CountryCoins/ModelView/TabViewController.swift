//
//  TabViewController.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import UIKit

class TabViewController: UITabBarController {
    private let appStorage = AppStorage()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTab()
    }
    
    private func configureTab() {
        let countryViewController = CountryViewController()
        countryViewController.appStorage = appStorage
        let currencyViewController = CurrencyViewController()
        
        //set image
        countryViewController.tabBarItem.image = UIImage(systemName: "network")
        currencyViewController.tabBarItem.image = UIImage(systemName: "dollarsign.arrow.circlepath")
        
        //set title
        countryViewController.title = "Countries"
        currencyViewController.title = "Currencies"
        
        let countryNav = UINavigationController(rootViewController: countryViewController)
        let currencyNav = UINavigationController(rootViewController: currencyViewController)
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
        
        setViewControllers([countryNav, currencyNav], animated: true)
    }
}

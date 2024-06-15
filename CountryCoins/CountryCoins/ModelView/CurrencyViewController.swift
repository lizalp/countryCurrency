//
//  CurrencyViewController.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import UIKit

class CurrencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var currencies: [String] = ["USD", "EUR", "MXN", "JPY", "GBP"]
    var exchangeRates: [String: Double] = ["USD": 1.0, "EUR": 0.85, "MXN": 19.84, "JPY": 110.49, "GBP": 0.75]
    
    private let fromCurrencyPicker = UIPickerView()
    private let toCurrencyPicker = UIPickerView()
    private let arrowImageView = UIImageView(image: UIImage(systemName: "arrow.right"))
    private let amountTextField = UITextField()
    private let convertButton = UIButton()
    private let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Currency Conversion"
        
        fromCurrencyPicker.delegate = self
        fromCurrencyPicker.dataSource = self
        toCurrencyPicker.delegate = self
        toCurrencyPicker.dataSource = self
        amountTextField.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(fromCurrencyPicker)
        view.addSubview(toCurrencyPicker)
        view.addSubview(arrowImageView)
        
        amountTextField.placeholder = "Ingresa monto"
        amountTextField.keyboardType = .decimalPad
        amountTextField.borderStyle = .roundedRect
        view.addSubview(amountTextField)
        
        convertButton.setTitle("Convertir", for: .normal)
        convertButton.setTitleColor(.white, for: .normal)
        convertButton.backgroundColor = .systemBlue
        convertButton.layer.cornerRadius = 5
        convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchUpInside)
        view.addSubview(convertButton)
        
        resultLabel.text = "Resultado: "
        resultLabel.textAlignment = .center
        view.addSubview(resultLabel)
    }
    
    private func setupConstraints() {
        fromCurrencyPicker.translatesAutoresizingMaskIntoConstraints = false
        toCurrencyPicker.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fromCurrencyPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            fromCurrencyPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fromCurrencyPicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            arrowImageView.centerYAnchor.constraint(equalTo: fromCurrencyPicker.centerYAnchor),
            arrowImageView.leadingAnchor.constraint(equalTo: fromCurrencyPicker.trailingAnchor, constant: 10),
            arrowImageView.widthAnchor.constraint(equalToConstant: 30),
            arrowImageView.heightAnchor.constraint(equalToConstant: 30),
            
            toCurrencyPicker.centerYAnchor.constraint(equalTo: fromCurrencyPicker.centerYAnchor),
            toCurrencyPicker.leadingAnchor.constraint(equalTo: arrowImageView.trailingAnchor, constant: 10),
            toCurrencyPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            toCurrencyPicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            amountTextField.topAnchor.constraint(equalTo: fromCurrencyPicker.bottomAnchor, constant: 20),
            amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            amountTextField.heightAnchor.constraint(equalToConstant: 40),
            
            convertButton.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 20),
            convertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            convertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            convertButton.heightAnchor.constraint(equalToConstant: 50),
            
            resultLabel.topAnchor.constraint(equalTo: convertButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func convertButtonTapped() {
        guard let amountText = amountTextField.text, let amount = Double(amountText), amount >= 0 else {
            resultLabel.text = "Monto invalido"
            return
        }
        
        let fromCurrency = currencies[fromCurrencyPicker.selectedRow(inComponent: 0)]
        let toCurrency = currencies[toCurrencyPicker.selectedRow(inComponent: 0)]
        
        if let fromRate = exchangeRates[fromCurrency], let toRate = exchangeRates[toCurrency] {
            let convertedAmount = amount * (toRate / fromRate)
            resultLabel.text = "Result: \(String(format: "%.2f", convertedAmount)) \(toCurrency)"
        } else {
            resultLabel.text = "Conversion error"
        }
    }
    
    // MARK: - UIPickerView DataSource & Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }
}

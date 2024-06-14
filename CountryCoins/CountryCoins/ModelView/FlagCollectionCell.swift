//
//  FlagCollectionCell.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import UIKit

class FlagCollectionCell: UICollectionViewCell {
    static let cell = "FlagCollectionCell"
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        //contenido a la celda
        contentView.addSubview(image)
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 80),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func update(with data: Flag) {
        //celda donde mostrare la bandera
        //actualizar texto e imagen
        //revisar tutorial de como hacerlo
        image.image = UIImage(named: data.flagName)
        label.text = data.countryName
    }
}

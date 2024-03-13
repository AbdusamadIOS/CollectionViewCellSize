//
//  MainVCCell.swift
//  CollectionViewCellSize
//
//  Created by Abdusamad Mamasoliyev on 13/03/24.
//

import UIKit

class MainVCCell: UICollectionViewCell {
    
    let conteneirView = UIView()
    static let identifeir = "MainVCCell"
   
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        contentView.addSubview(conteneirView)
        conteneirView.layer.cornerRadius = 5
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func layout() {
        conteneirView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            conteneirView.topAnchor.constraint(equalTo: topAnchor),
            conteneirView.bottomAnchor.constraint(equalTo: bottomAnchor),
            conteneirView.leadingAnchor.constraint(equalTo: leadingAnchor),
            conteneirView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

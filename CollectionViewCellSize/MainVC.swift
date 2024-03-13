//
//  MainVC.swift
//  CollectionViewCellSize
//
//  Created by Abdusamad Mamasoliyev on 13/03/24.
//

import UIKit

class MainVC: UIViewController {
    
    var collection: UICollectionView!
    var colors: [Colors] = [Colors(color: .systemGray),
                            Colors(color: .systemGray2),
                            Colors(color: .systemGray3),
                            Colors(color: .systemGray4),
                            Colors(color: .systemGray5),
                            Colors(color: .systemGray6),]
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCellSize()
        navBar()
        style()
        layoutColl()
    }
    func currentCellSize() {
        let layout = UICollectionViewFlowLayout()
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let width = (view.frame.width - 20)
        let cellSize = CGSize(width: width , height: 150)
        layout.itemSize = cellSize
        layout.scrollDirection = .vertical
        collection.setCollectionViewLayout(layout, animated: true)
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func navBar() {
        let button = UIBarButtonItem(image: UIImage(systemName: "square"), style: .done, target: self, action: #selector(tapButton))
        navigationItem.rightBarButtonItem = button
        button.tintColor = .black
    }
    func style() {
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .secondarySystemBackground
        collection.delegate = self
        collection.dataSource = self
        collection.register(MainVCCell.self, forCellWithReuseIdentifier: MainVCCell.identifeir)
    }
    func layoutColl() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainVCCell.identifeir, for: indexPath) as? MainVCCell else { return UICollectionViewCell() }
        cell.conteneirView.backgroundColor = colors[indexPath.item].color
        return cell
    }

    @objc func tapButton() {
        if navigationItem.rightBarButtonItem?.image == UIImage(systemName: "square") {
            
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "square.split.2x2")
            let width = ((collection.frame.width - 30) / 2)
            let cellSize = CGSize(width: width , height: 200)
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.itemSize = cellSize
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            collection.setCollectionViewLayout(layout, animated: true)
            
        } else if navigationItem.rightBarButtonItem?.image == UIImage(systemName: "square.split.2x2") {
            
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "square.grid.3x3")
            let width = ((collection.frame.width - 50) / 4)
            let cellSize = CGSize(width: width , height: 100)
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.itemSize = cellSize
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            collection.setCollectionViewLayout(layout, animated: true)
            
        } else if navigationItem.rightBarButtonItem?.image == UIImage(systemName: "square.grid.3x3") {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "square")
            let layout = UICollectionViewFlowLayout()
            let width = (view.frame.width - 20)
            let cellSize = CGSize(width: width , height: 150)
            layout.itemSize = cellSize
            layout.scrollDirection = .vertical
            collection.setCollectionViewLayout(layout, animated: true)
        }
    }
    
}

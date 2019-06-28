//
//  ViewController.swift
//  Checkpoint
//
//  Created by Djaka Pradana on 26/06/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

private let reusableId = "idCell"
class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let menu: [String] = [
        "Promo",
        "Flash",
        "Categories",
        "Menu Image View",
        "Menu UIView"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reusableId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableId, for: indexPath)
        
        cell.backgroundColor = .red
        
        let label: UILabel = UILabel()
        label.text = menu[indexPath.row]
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        cell.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: cell.centerYAnchor)
        ])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(2 - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(2))
        
        return CGSize(width: size, height: size)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var detail:UIViewController!
        
        switch indexPath.row {
        case 0:
            detail = MenuListDetail(mode: .Promo)
        case 1:
            detail = MenuListDetail(mode: .Flash)
        case 2:
            detail = MenuListDetail(mode: .Categories)
        case 3:
            detail = ImageViewController()
            break
        case 4:
            detail = UIStoryboard(name: "UIForm", bundle: nil).instantiateViewController(withIdentifier: "UIFormViewController") as! UIFormViewController
        default:
            detail = MenuListDetail(mode: .Promo)
            break
        }
        navigationController?.pushViewController(detail, animated: true)
    }
    

}


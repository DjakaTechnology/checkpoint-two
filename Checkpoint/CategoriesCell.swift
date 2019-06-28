//
//  CategoriesCell.swift
//  Checkpoint
//
//  Created by Djaka Pradana on 28/06/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class CategoriesCell: UITableViewCell {
    let lbTitle = UILabel()
    let lbDesc = UILabel()
    
    var model: CategoriesModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(){
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.font = UIFont.boldSystemFont(ofSize: 18)
        lbTitle.numberOfLines = 0
        
        lbDesc.translatesAutoresizingMaskIntoConstraints = false
        lbDesc.textColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 00.5)
        lbDesc.numberOfLines = 0
        
        self.addSubview(lbTitle)
        self.addSubview(lbDesc)
        
        NSLayoutConstraint.activate([
            lbTitle.topAnchor.constraint(equalTo: self.topAnchor),
            lbTitle.leftAnchor.constraint(equalTo: self.leftAnchor),
            lbTitle.rightAnchor.constraint(equalTo: self.rightAnchor),
            lbDesc.topAnchor.constraint(equalTo: lbTitle.bottomAnchor),
            lbDesc.leftAnchor.constraint(equalTo: lbTitle.leftAnchor),
            lbDesc.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.bottomAnchor.constraint(equalTo: lbDesc.bottomAnchor)
        ])
        
        lbTitle.text = model.name
        var desc: String = ""
        for s in model.children!{
            desc.append(s.name! + ",")
        }
        lbDesc.text = desc
    }

}

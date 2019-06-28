//
//  CustomTableViewCell.swift
//  Checkpoint
//
//  Created by Djaka Pradana on 28/06/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let lbTitle = UILabel()
    let lbDesc = UILabel()
    let ivImage = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.font = UIFont.boldSystemFont(ofSize: 18)
        
        lbDesc.translatesAutoresizingMaskIntoConstraints = false
        lbDesc.textColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 00.5)
        lbDesc.numberOfLines = 0
        
        ivImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(lbTitle)
        contentView.addSubview(lbDesc)
        contentView.addSubview(ivImage)
    }
}

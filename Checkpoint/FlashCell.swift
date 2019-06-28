//
//  FlashCell.swift
//  Checkpoint
//
//  Created by Djaka Pradana on 28/06/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class FlashCell: UITableViewCell {
    let lbTitle = UILabel()
    let lbDesc = UILabel()
    let imgView = UIImageView()
    
    var model: FlashModel!

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
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(lbTitle)
        self.addSubview(lbDesc)
        self.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imgView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imgView.topAnchor.constraint(equalTo: self.topAnchor),
            imgView.widthAnchor.constraint(equalTo: self.widthAnchor),
            imgView.heightAnchor.constraint(equalToConstant: 120),
            lbTitle.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 4),
            lbTitle.heightAnchor.constraint(equalToConstant: 24),
            lbTitle.leftAnchor.constraint(equalTo: self.leftAnchor),
            lbDesc.topAnchor.constraint(equalTo: lbTitle.bottomAnchor),
            lbDesc.leftAnchor.constraint(equalTo: lbTitle.leftAnchor),
            self.bottomAnchor.constraint(equalTo: lbDesc.bottomAnchor)
        ])
        let title = model.info?.url?.components(separatedBy: "/")
        
        lbTitle.text = title?.last?.replacingOccurrences(of: "-", with: " ").capitalized
        lbDesc.text = model.descriptionValue
        imgView.sd_setImage(with: URL(string: model.image ?? ""), placeholderImage: UIImage(named: "img_placeholder"))
    }

}

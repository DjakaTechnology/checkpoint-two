//
//  MenuListDetail.swift
//  Checkpoint
//
//  Created by Djaka Pradana on 26/06/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

enum Mode: String {
    case Promo
    case Categories
    case Flash
}

class MenuListDetail: UITableViewController {
    private let promoCell = "promocell"
    private let categoriesCell = "categoriescell"
    private let flashCell = "flashCell"
    public var urlString = "https://api.bukalapak.com/v2/products/promo_banners.json"
    private var keyName = ""
    private var data: [PromoModel] = []
    private var dataFlash: [FlashModel] = []
    private var dataCategoreis: [CategoriesModel] = []
    
    var mode: Mode = .Categories
    
    init(mode: Mode){
        self.mode = mode
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUrl()
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        title = mode.rawValue
        prepareData()
    }
    
    func setupTable() {
        tableView.register(PromoCell.self, forCellReuseIdentifier: promoCell)
        tableView.register(FlashCell.self, forCellReuseIdentifier: flashCell)
        tableView.register(CategoriesCell.self, forCellReuseIdentifier: categoriesCell)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupUrl() {
        switch mode {
        case .Promo:
            urlString = "https://api.bukalapak.com/v2/products/promo_banners.json"
            keyName = "promo_banners"
            break
        case .Flash:
            urlString = "https://api.bukalapak.com/v2/flash_banners.json"
            keyName = "banners"
        case .Categories:
            urlString = "https://api.bukalapak.com/v2/categories.json"
            keyName = "categories"
        default:
            urlString = "https://api.bukalapak.com/v2/products/promo_banners.json"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch mode {
            case .Promo:
                return data.count
            case .Categories:
                return dataCategoreis.count
            case .Flash:
                return dataFlash.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mode {
        case .Promo:
            return renderPromoCell(row: indexPath.row)
        case .Categories:
            return renderCategoriesCell(row: indexPath.row)
        case .Flash:
            return renderFlashCell(row: indexPath.row)
        }
    }
    
    func renderPromoCell(row: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: promoCell) as! PromoCell
        
        let datas = data[row]
        cell.title = datas.descriptionValue ?? ""
        cell.desc = datas.descriptionValue ?? ""
        cell.images = datas.image ?? ""
        
        cell.setupCell()
        
        return cell
    }
    
    func renderCategoriesCell(row: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoriesCell) as! CategoriesCell
        
        cell.model = dataCategoreis[row]
        
        cell.setupCell()
        
        return cell
    }
    
    func renderFlashCell(row: Int) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: flashCell) as! FlashCell
        
        cell.model = dataFlash[row]
        
        cell.setupCell()
        
        return cell
    }
    
    func prepareData(){
        guard let url: URL = URL(string: urlString) else { return }
        
        Alamofire
            .request(url, method: .get)
            .validate()
            .responseJSON {[weak self] (response) in
                guard response.result.isSuccess else { return }
                
                let json = JSON(response.result.value as Any)
                
                for item in json[self!.keyName]{
                    switch self!.mode{
                        case .Categories :
                            self?.dataCategoreis.append(CategoriesModel(json: item.1))
                        case .Flash :
                            self?.dataFlash.append(FlashModel(json: item.1))
                        case .Promo :
                            self?.data.append(PromoModel(json: item.1))
                    }
                }
                
                self?.tableView.reloadData()
        }
        
        
    }
    
}

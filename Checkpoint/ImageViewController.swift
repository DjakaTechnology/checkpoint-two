//
//  ImageViewController.swift
//  Checkpoint
//
//  Created by Djaka Pradana on 26/06/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    let containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        let image:UIImage? = UIImage(named: "img_simpanalamat")
        imageView.image = image
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Transaksi lebih cepat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kamu cukup menyimpan alamat pengiriman sekali saja untuk mempercepat transaksi berikutnya"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 135/255, green: 153/255, blue: 153/255, alpha: 0.87)
        return label
    }()
    
    let otherMenu: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Menu lain"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.87)
        
        return label;
    }()
    
    let titleMenu: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Keuntungan mendaftar"
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    let buttonView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let registerButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Daftar Akun", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.87)
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
        return button
    }()
    
    let loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.87), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
        return button
    }()
    
    let horizontalViewMargin: CGFloat = 24
    
    private func setupLayout(){
        view.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            descriptionLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -(horizontalViewMargin * 2)),
            containerView.topAnchor.constraint(equalTo: imageView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        view.addSubview(otherMenu)
        view.addSubview(titleMenu)
        
        view.addSubview(buttonView)
        buttonView.addArrangedSubview(loginButton)
        buttonView.addArrangedSubview(registerButton)
        
        NSLayoutConstraint.activate([
            otherMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            otherMenu.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -32),
            titleMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleMenu.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
}

//
//  CellCountry.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import UIKit

protocol CellCountryConfiguration {
    func setName(name : String?)
    func setCode (code : String?)
    
}

class CellCountry : UITableViewCell {
    
    private let stackView : UIStackView = {
        let l = UIStackView()
        l.spacing = 10
        l.axis = .horizontal
        l.distribution = .fillEqually
        l.layer.cornerRadius = 4
        l.layer.borderWidth = 1
        l.isLayoutMarginsRelativeArrangement = true
        l.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
        return l
    }()
    
    private let labelName : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15)
        l.textColor = .black
        return l
    }()
    
    private let labelCode : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15)
        l.textColor = .black
        l.textAlignment = .right
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    private func initViews () {
        addViews()
        self.selectionStyle = .none
    }
    
    private func addViews () {
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(labelName)
        stackView.addArrangedSubview(labelCode)
        
        stackView.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4 , height: 40 )

    }
    
    override var isSelected: Bool {
        
        didSet{
            if isSelected {
                stackView.layer.borderColor = UIColor.black.cgColor
            }else {
                stackView.layer.borderColor = UIColor.white.cgColor
            }
        }
        
    }
    
}


extension CellCountry : CellCountryConfiguration {
    
    func setName(name: String?) {
        labelName.text =  name
    }
    
    func setCode(code: String?) {
        labelCode.text = code
    }
    
}

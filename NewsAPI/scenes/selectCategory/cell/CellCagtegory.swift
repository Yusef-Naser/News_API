//
//  CellCagtegory.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import UIKit

protocol CellCategoryConfiguration {
    func setTitle (title : String?)
    
}

class CellCagtegory : UITableViewCell {
    
    private let containerView : UIView = {
        let l = UIView()
        l.layer.cornerRadius = 4
        l.layer.borderWidth = 1
        return l
    }()
    
    private let labelTitle : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15)
        l.textColor = .black
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
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(labelTitle)
        
        containerView.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4 , height: 40 )
        
        labelTitle.anchor(top: containerView.topAnchor , leading: containerView.leadingAnchor , bottom: containerView.bottomAnchor , trailing: containerView.trailingAnchor , paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4 )
        
    }
    
    override var isSelected: Bool {
        
        didSet{
            if isSelected {
                containerView.layer.borderColor = UIColor.black.cgColor
            }else {
                containerView.layer.borderColor = UIColor.white.cgColor
            }
        }
        
    }
    
}


extension CellCagtegory : CellCategoryConfiguration {
    
    func setTitle(title: String?) {
        labelTitle.text = title
    }
    
}

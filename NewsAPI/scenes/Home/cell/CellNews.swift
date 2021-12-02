//
//  CellNews.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import UIKit

protocol CellNewsConfiguration {
    func setImage (image : String?)
    func setTitle (title : String?)
}

class CellNews : UITableViewCell {
    
    private let imageNews : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.clipsToBounds = true
        l.image = #imageLiteral(resourceName: "placeholder")
        return l
    }()
    
    private let labelTitle : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15)
        l.numberOfLines = 0
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
        
        contentView.addSubview(imageNews)
        contentView.addSubview(labelTitle)
        
        imageNews.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8 , width: 70, height: 70 )
        labelTitle.anchor(top: imageNews.topAnchor , leading: imageNews.trailingAnchor , trailing: contentView.trailingAnchor , paddingLeft: 8 , paddingRight: 8 )
        
        labelTitle.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor , constant: -8).isActive = true
        
    }
    
}


extension CellNews : CellNewsConfiguration {
    
    func setImage(image: String?) {
        imageNews.loadImage(at: image ?? "")
    }
    func setTitle(title: String?) {
        labelTitle.text = title
    }
   
}

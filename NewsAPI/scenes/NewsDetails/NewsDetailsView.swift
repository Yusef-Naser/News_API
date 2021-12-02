//
//  NewsDetailsView.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//VC

import UIKit

protocol NewsDetailsViewConfiguration {
    func setImage (image : String?)
    func setTitle (title : String?)
    func setDescription (des : String?)
    func setSource (source : String?)
    func setAuthor (author : String?)
}

class NewsDetailsView : UIView {
    
    lazy var scrollView : UIScrollView = {
        let s = UIScrollView()
        s.addSubview(stackViews)
        stackViews.anchor(top: s.topAnchor , leading: s.leadingAnchor , bottom: s.bottomAnchor , trailing: s.trailingAnchor )
        stackViews.widthAnchor.constraint(equalTo: s.widthAnchor , multiplier: 1).isActive = true
        return s
    }()
    
    
    private let imageViewNews : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.clipsToBounds = true
        return l
    }()
    
    private let labelTitle : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 20)
        l.numberOfLines = 0
        return l
    }()
    
    private let viewLine_1 : UIView = {
        let l = UIView()
        l.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return l
    }()
    
    private let labelDescription : UILabel = {
        let l = UILabel()
        l.text = "Description: "
        return l
    }()
    
    private let labelDescriptionValue : UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textColor = .gray
        return l
    }()
    
    private let viewLine_2 : UIView = {
        let l = UIView()
        l.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return l
    }()
    
    private let labelSource : UILabel = {
        let l = UILabel()
        l.text = "Source: "
        return l
    }()
    
    private let labelSourceValue : UILabel = {
        let l = UILabel()
        l.textColor = .gray
        return l
    }()
    
    private let viewLine_3 : UIView = {
        let l = UIView()
        l.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return l
    }()
    
    private let labelAuthor : UILabel = {
        let l = UILabel()
        l.text = "Author: "
        return l
    }()
 
    private let viewLine_4 : UIView = {
        let l = UIView()
        l.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return l
    }()
    
    private let labelAuthorValue : UILabel = {
        let l = UILabel()
        l.textColor = .gray
        return l
    }()
    

    
    let buttonNavigation : UIButton = {
        let l = UIButton()
        l.setTitle("Navigate to web", for: .normal)
        l.setTitleColor(.black , for: .normal)
        l.layer.cornerRadius = 10
        l.layer.borderWidth = 1
        l.layer.borderColor = UIColor.black.cgColor
        return l
    }()
    
    private lazy var stackViews : UIStackView = {
        let l = UIStackView()
        l.spacing = 15
        l.axis = .vertical
        
        l.addArrangedSubview(imageViewNews)
        l.addArrangedSubview(labelTitle)
        l.addArrangedSubview(viewLine_1)
        l.addArrangedSubview(labelDescription)
        l.addArrangedSubview(labelDescriptionValue)
        l.addArrangedSubview(viewLine_2)
        l.addArrangedSubview(labelSource)
        l.addArrangedSubview(labelSourceValue)
        l.addArrangedSubview(viewLine_3)
        l.addArrangedSubview(labelAuthor)
        l.addArrangedSubview(labelAuthorValue)
        l.addArrangedSubview(viewLine_4)
        l.addArrangedSubview(buttonNavigation)
        
        imageViewNews.heightAnchor.constraint(equalToConstant: 200 ).isActive = true
        viewLine_1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        viewLine_2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        viewLine_3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        viewLine_4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        buttonNavigation.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    private func initViews () {
        addViews()
    }
    
    private func addViews () {
        
        addSubview(scrollView)
        
        scrollView.anchor(top: topAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
    }
        
}

extension NewsDetailsView : NewsDetailsViewConfiguration {
    
    func setImage(image: String?) {
        imageViewNews.loadImage(at: image ?? "" )
    }
    
    func setTitle(title: String?) {
        labelTitle.text = title
    }
    
    func setDescription(des: String?) {
        labelDescriptionValue.text = (des == nil) ? "Does not exist" : des
    }
    
    func setSource(source: String?) {
        labelSourceValue.text = (source == nil) ? "Does not exist" : source
    }
    
    func setAuthor(author: String?) {
        labelAuthorValue.text = (author == nil) ? "Does not exist" : author
    }
    
}

//
//  SelectCountryView.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//VC

import UIKit


class SelectCountryView : UIView {
    
    private let labelSelectCountry : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 25)
        l.textAlignment = .center
        l.text = "Please Select Country"
        return l
    }()
    
    let tableView : UITableView = {
        let l = UITableView()
        l.tableFooterView = UIView()
        l.register(CellCountry.self , forCellReuseIdentifier: CellCountry.getIdentifier())
        return l
    }()
    
    let buttonNext : UIButton = {
        let l = UIButton()
        l.setTitle("Next", for: .normal)
        l.setTitleColor(.black , for: .normal)
        l.layer.cornerRadius = 4
        l.layer.borderWidth = 1
        l.layer.borderColor = UIColor.black.cgColor
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
        
        addSubview(labelSelectCountry)
        addSubview(tableView)
        addSubview(buttonNext)
        
        labelSelectCountry.anchor(top: safeAreaLayoutGuide.topAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 )
        tableView.anchor(top: labelSelectCountry.bottomAnchor , leading: leadingAnchor , bottom: buttonNext.topAnchor , trailing: trailingAnchor , paddingTop: 8 , paddingLeft: 8 , paddingBottom: 8 , paddingRight: 8 )
        
        buttonNext.anchor( leading: leadingAnchor , bottom: safeAreaLayoutGuide.bottomAnchor , trailing: trailingAnchor , paddingLeft: 16, paddingBottom: 16, paddingRight: 16 , height: 40 )
        
    }
    
    func setDelegate (delegate : SelectCountryVC?) {
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    
    
}

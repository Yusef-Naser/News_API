//
//  HomeView.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//VC

import UIKit


class HomeView : UIView {
    
    let searchBar : UISearchBar = {
        let l = UISearchBar()
        l.showsCancelButton = true
        return l
    }()
    
    let tableView : UITableView = {
        let l = UITableView()
        l.tableFooterView = UIView()
        l.register(CellNews.self , forCellReuseIdentifier: CellNews.getIdentifier())
        l.keyboardDismissMode = .onDrag
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
        addSubview(searchBar)
        addSubview(tableView)
        
        searchBar.anchor(top: safeAreaLayoutGuide.topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        tableView.anchor(top: searchBar.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
    }
    
    func setDelegate (delegate : HomeVC?) {
        tableView.delegate = delegate
        tableView.dataSource = delegate
        searchBar.delegate = delegate
    }
    
}

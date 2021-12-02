//
//  HomeVC.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import UIKit

class HomeVC : BaseVC<HomeView> {
    
    private var presenter : ProHomePresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = HomePresenter(view : self )
        mainView.setDelegate(delegate: self)
        navigationItem.title = "News Api"
        presenter?.getNews()
        refreshController = mainView.tableView.addRefreshController()
        refreshController?.addTarget(self , action: #selector( actionRefresh ), for: .valueChanged)
        
    }
    
    @objc private func actionRefresh () {
        presenter?.refreshNews()
    }
    
}

extension HomeVC : ProHomeView {
    func fetchNews() {
        mainView.tableView.reloadData()
    }
}


extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter?.callPaginationNews(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getNewsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellNews.getIdentifier() , for: indexPath) as! CellNews
        presenter?.configurationCell(cell: cell , index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(NewsDetailsVC(modelArticle: presenter?.getNewsItem(index: indexPath.row )), animated: true )
    }
    
}

extension HomeVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            Debouncer.instance.call().callback = { [weak self] in
                self?.presenter?.getSearchNews(text: "")
            }
            mainView.endEditing(true )
            return
        }
        Debouncer.instance.call().callback = { [weak self] in
            self?.presenter?.getSearchNews(text: searchText)
        }
    }
    
    func searchBarCancelButtonClicked (_ searchBar: UISearchBar ) {
        searchBar.text = ""
        self.presenter?.getSearchNews(text: "")
        mainView.endEditing(true )
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.endEditing(true)
    }
    
}

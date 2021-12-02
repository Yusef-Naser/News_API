//
//  HomePresenter.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//VC

import Foundation

protocol ProHomeView : StatusApi {
    func fetchNews ()
}

protocol ProHomePresetner {

    func getNews ()
    func getNewsCount () -> Int
    func getNewsItem (index : Int) -> ModelArticle?
    func configurationCell (cell : CellNewsConfiguration , index : Int)
    func callPaginationNews (index : Int)
    func refreshNews ()
    func getSearchNews (text : String)
}


class HomePresenter : ProHomePresetner {
    
    weak var view : ProHomeView?
    private let interactor = HomeInteractor()
    
    private let paginationNews = PaginationClass<ModelArticle>()
    private var searchText = ""
    private let pageSize : Int = 20
    
    init(view : ProHomeView ) {
        self.view = view
    }
    
    func getNews() {
        if  !( paginationNews.beforeCallService() ) {
            return
        }
        if paginationNews.refreshValue {
            paginationNews.refreshValue = false
        }else {
            self.view?.showLoading()
        }
        interactor.getNews(pageSize : pageSize , page: paginationNews.currentPage , query: searchText ) { data , error , statusCode in
            self.view?.hideLoading()
            guard let articles = data?.articles else {
                return
            }
            
            let count = self.paginationNews.listData.count + articles.count
            let currentPage = Int(ceil(Double( count ) / Double(self.pageSize) ))
            let lastPage = ceil( Double(data?.totalResults ?? 0) / Double(self.pageSize)  )
            
            self.paginationNews.setDataPagination(listData: articles , currentPage: currentPage , lastPage: Int(lastPage) )
            self.view?.fetchNews()
        }
    }
    
    func configurationCell(cell: CellNewsConfiguration, index: Int) {
        guard let article = getNewsItem(index: index) else {
            return
        }
        cell.setImage(image: article.urlToImage)
        cell.setTitle(title: article.title)
    }
    
    func getNewsCount() -> Int {
        paginationNews.listData.count
    }
    
    func getNewsItem(index: Int) -> ModelArticle? {
        guard getNewsCount() > index else {
            return nil
        }
        return paginationNews.listData[index]
    }
    
    func callPaginationNews(index: Int) {
        if paginationNews.allowPagination(index: index) {
            getNews()
        }
    }
    
    func refreshNews() {
        paginationNews.refreshValue = true
        paginationNews.resetData()
        getNews()
    }
    
    func getSearchNews(text: String) {
        searchText = text
        refreshNews()
        self.view?.showLoading()
    }
    
}

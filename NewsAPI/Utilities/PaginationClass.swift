//
//  PaginationClass.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

/**
 
 Example :
 
 let pagination = PaginationClass<String>()
 
 
    func callPagination (index : Int ) {
        if pagination.allowPagination(index: index) {
            callGetData()
        }
    }
 
    // when user wip to refresh
     func refreshData() {
        pagination.refreshValue = true
         pagination.resetData()
         callGetData()
     }
 
 
    // get item in list
    func getItemInList ( index : Int  ) {
        let item =   pagination.listData[index]
    }
 
    func getData () {
            if  !( pagination.beforeCallService() ) {
                return
            }

            if pagination.refreshValue {
                pagination.refreshValue = false
            }else {
                self.view?.showLoading()
            }
 
            // call get data   ( page :  pagination.currentPage   )
            // get get data is success
            self.pagination.setDataPagination(listData : responseList  ,
                currentPage: data?.meta.currentPage ?? 1  ,
                lastPage: data?.meta.lastPage ?? 1  )
    }
 
 
 
 */


class PaginationClass <T> {
    
    public var currentPage : Int = 0
    public var lastPage : Int = 1
    public var paginate : Bool = false
    public var listData : [T] = []
    private var firstLoad = true
    
    public var refreshValue = false
    
    public init() {}
    
    public func resetData() {
        listData = []
        currentPage = 0
        lastPage = 1
        paginate = false
    }
    
    
    public func beforeCallService () -> Bool  {
        if currentPage >= lastPage {
            return false
        }
        if paginate {
            return false
        }
        paginate = true
        currentPage += 1
        firstLoad = false
        return true
    }
    
    public func isFirstLoad () -> Bool {
        
        return firstLoad
    }
    
    public func setDataPagination (listData : [T] , currentPage : Int , lastPage : Int ) {
        self.currentPage = currentPage
        self.lastPage = lastPage
        self.paginate = false
        self.listData += listData
        firstLoad = false
    }
    
    
    public func allowPagination (index : Int ) -> Bool {

        if currentPage >= lastPage {
            return false
        }
        if paginate {
            return false
        }

        if index == listData.count - 1 {
            return true
        }
        return false
    }
    
    
}

//
//  BaseVC.swift
//  NearBy
//
//  Created by Yusef Naser on 26/11/2021.
//

import UIKit

class BaseVC <T : UIView> : UIViewController , StatusApi {
    
    
    func showLoading() {
        Loader.instance.showLoading(view: mainView)
    }
    
    func hideLoading() {
        refreshController?.endRefreshing()
        Loader.instance.hideLoading()
    }
    
    func showMessage(message: String) {
        SnackBar.instance.showSnackBar(view: mainView , text: message)
    }
    
    var refreshController : UIRefreshControl?
    
    override func loadView() {
        let t  = T()
        t.backgroundColor = .white
        self.view = t
    }
    
    var mainView : T {
        if let view = self.view as? T {
            return view
        }else {
         let view = T()
         self.view = view
         return view
        }
    }
    

    
}

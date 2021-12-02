//
//  NewsDetailsVC.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import UIKit

class NewsDetailsVC : BaseVC<NewsDetailsView> {
    
    private var presenter : ProNewsDetailsPresetner?
    private var modelArticle : ModelArticle?
    
    init(modelArticle : ModelArticle?) {
        super.init(nibName: nil , bundle: nil)
        self.modelArticle = modelArticle
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = NewsDetailsPresenter( modelArticle: modelArticle )
        presenter?.configurationView(view: mainView)
        mainView.buttonNavigation.addTarget(self , action: #selector(actionNavigation), for: .touchUpInside )
    }
    
    @objc private func actionNavigation () {
        guard let url = modelArticle?.url else {
            return
        }
        openURL(url: url )
    }
    
}


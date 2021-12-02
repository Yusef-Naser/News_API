//
//  NewsDetailsPresenter.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//VC


protocol ProNewsDetailsPresetner {
    
    func configurationView (view : NewsDetailsViewConfiguration)
    
}


class NewsDetailsPresenter : ProNewsDetailsPresetner {
    
    private var modelArticle : ModelArticle?
    
    init( modelArticle : ModelArticle? ) {
        self.modelArticle = modelArticle
    }
    
    func configurationView(view: NewsDetailsViewConfiguration) {
        guard let article = modelArticle else {
            return
        }
        view.setImage(image: article.urlToImage)
        view.setAuthor(author: article.author)
        view.setTitle(title: article.title)
        view.setDescription(des: article.articleDescription)
        view.setSource(source: article.source?.name)
        
    }
    
}

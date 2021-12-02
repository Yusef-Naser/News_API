//
//  SelectCategoryPresenter.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//VC


protocol ProSelectCategoryPresetner {

    func selectedCategory (index : Int)
    func getCategoriesCount () -> Int
    func configurationCell (cell : CellCategoryConfiguration , index : Int )
    func isSelected (index : Int) -> Bool
    func userSelected () -> Bool
}


class SelectCategoryPresenter : ProSelectCategoryPresetner {
    
    private let listCategories = [
        "business" ,
        "entertainment" ,
        "general" ,
        "health" ,
        "science" ,
        "sports" ,
        "technology" ,
    ]
    
    init() {
        
    }
    
    func getCategory (index : Int) -> String? {
        guard listCategories.count > index else {
            return nil
        }
        return listCategories[index]
    }
    
    func configurationCell(cell: CellCategoryConfiguration, index: Int) {
        guard let category = getCategory(index: index) else {
            return
        }
        cell.setTitle(title: category)
    }
    
    func getCategoriesCount() -> Int {
        listCategories.count
    }
    
    func selectedCategory(index: Int) {
        guard let category = getCategory(index: index) else {
            return
        }
        SharedData.instance.selectedCategory = category
    }
    
    func isSelected(index : Int) -> Bool {
        guard let c = getCategory(index: index) else {
            return false
        }
        return c == SharedData.instance.selectedCategory
    }
    
    func userSelected() -> Bool {
        SharedData.instance.selectedCategory != nil ||
            ( SharedData.instance.selectedCategory?.count ?? 0 ) > 0
    }
    
}

//
//  SelectCategoryVC.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import UIKit

class SelectCategoryVC : BaseVC<SelectCategoryView> {
    
    private var presenter : ProSelectCategoryPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = SelectCategoryPresenter( )
        self.mainView.setDelegate(delegate: self )
        mainView.buttonNext.addTarget(self , action: #selector( actionNext ), for: .touchUpInside)
    }
    
    @objc private func actionNext () {
        guard presenter?.userSelected() == true else {
            self.showMessage(message: "Please select Category")
            return
        }
        guard SharedData.instance.selectedCountry != nil ||
                (SharedData.instance.selectedCountry?.count ?? 0) > 0   else {
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let sceneDelegate = windowScene.delegate as? SceneDelegate
              else {
                return
              }
            sceneDelegate.window?.rootViewController = SelectCountryVC()
            return
        }
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate
          else {
            return
          }
        sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: HomeVC())
        
        
    }
    
}


extension SelectCategoryVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getCategoriesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellCagtegory.getIdentifier() , for: indexPath ) as! CellCagtegory
        presenter?.configurationCell(cell: cell , index: indexPath.row)
        
        if presenter?.isSelected(index: indexPath.row) == true {
            cell.isSelected = true
            tableView.selectRow(at: indexPath , animated: true , scrollPosition: .none)
        }else {
            cell.isSelected = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CellCagtegory else {
            return
        }
        cell.isSelected = true
        presenter?.selectedCategory(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CellCagtegory else {
            return
        }
        cell.isSelected = false
    }
    
}

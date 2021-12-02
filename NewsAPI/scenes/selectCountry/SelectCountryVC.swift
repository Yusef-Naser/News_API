//
//  SelectCountryVC.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import UIKit

class SelectCountryVC : BaseVC<SelectCountryView> {
    
    private var presenter : ProSelectCountryPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = SelectCountryPresenter()
        mainView.setDelegate(delegate: self )
        mainView.buttonNext.addTarget(self , action: #selector( actionNext ), for: .touchUpInside )
    }
    
    @objc private func actionNext () {
        guard presenter?.userSelected() == true else {
            self.showMessage(message: "Please select Country")
            return
        }
        guard SharedData.instance.selectedCategory != nil ||
                (SharedData.instance.selectedCategory?.count ?? 0) > 0   else {
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let sceneDelegate = windowScene.delegate as? SceneDelegate
              else {
                return
              }
            sceneDelegate.window?.rootViewController = SelectCategoryVC()
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

extension SelectCountryVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getCountriesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellCountry.getIdentifier() , for: indexPath ) as! CellCountry
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
        guard let cell = tableView.cellForRow(at: indexPath) as? CellCountry else {
            return
        }
        cell.isSelected = true
        presenter?.selectedCountry(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CellCountry else {
            return
        }
        cell.isSelected = false
    }
    
}

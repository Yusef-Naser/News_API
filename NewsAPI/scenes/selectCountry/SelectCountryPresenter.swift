//
//  SelectCountryPresenter.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//VC

import Foundation

protocol ProSelectCountryPresetner {

    func selectedCountry (index : Int)
    func getCountriesCount () -> Int
    func configurationCell (cell : CellCountryConfiguration , index : Int )
    func isSelected (index : Int) -> Bool
    func userSelected () -> Bool
    
}


class SelectCountryPresenter : ProSelectCountryPresetner {
    
    
    private let listCountries = [
        "ae" , "ar" , "at" , "au" , "be" , "bg" ,
        "br" , "ca" , "ch" , "cn" , "co" , "cu" ,
        "cz" , "de" , "eg" , "fr" , "gb" , "gr" ,
        "hk" , "hu" , "id" , "ie" , "il" , "in" ,
        "it" , "jp" , "kr" , "lt" , "lv" , "ma" ,
        "mx" , "my" , "ng" , "nl" , "no" , "nz" ,
        "ph" , "pl" , "pt" , "ro" , "rs" , "ru" ,
        "sa" , "se" , "sg" , "si" , "sk" , "th" ,
        "tr" , "tw" , "ua" , "us" , "ve" , "za" ,
 
    ]
    
    init() {
        
    }
    
    func getCountry (index : Int)-> String? {
        guard listCountries.count > index else {
            return nil
        }
        return listCountries[index]
    }
    func getCountriesCount () -> Int {
        listCountries.count
    }
    func configurationCell (cell : CellCountryConfiguration , index : Int ) {
        guard let country = getCountry(index: index) else {
            return
        }
        cell.setCode(code: country)
        cell.setName(name: getCountryName(code: country))
    }
    
    func selectedCountry(index: Int) {
        guard let country = getCountry(index: index) else {
            return
        }
        SharedData.instance.selectedCountry = country
    }
    
    func isSelected (index : Int) -> Bool {
        guard let c = getCountry(index: index) else {
            return false
        }
        return c == SharedData.instance.selectedCountry
    }
    
    func getCountryName (code : String ) -> String? {
        let locale = Locale.init(identifier: "en_US" )
        return ( locale as NSLocale).displayName(forKey: .countryCode , value: code )
    }
    
    func userSelected() -> Bool {
        SharedData.instance.selectedCountry != nil ||
            ( SharedData.instance.selectedCountry?.count ?? 0 ) > 0
    }
    
}

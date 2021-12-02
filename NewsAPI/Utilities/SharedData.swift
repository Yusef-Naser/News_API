//
//  SharedData.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import Foundation


class SharedData {
    
    static let instance = SharedData()
    
    private var userDefaults = UserDefaults.standard
    private let SELECTED_CATEGORY = "selectedCategory"
    private let SELECTED_COUNTRY = "selectedCountry"
    private let FIRST_RUN = "firstRun"
    
    
    private init() {
        
    }
    
    var firstRun : Bool {
        get {
            userDefaults.bool(forKey: FIRST_RUN)
        }
        set {
            userDefaults.set(newValue , forKey: FIRST_RUN)
        }
    }
    
    var selectedCategory: String?
    {
        get {
            if let l = userDefaults.string(forKey: SELECTED_CATEGORY) {
                return l
            }else {
                return nil
            }
        }
        set {
            userDefaults.set( newValue , forKey: SELECTED_CATEGORY )
        }
    }
    
    var selectedCountry : String?
    {
        get {
            if let l = userDefaults.string(forKey: SELECTED_COUNTRY) {
                return l
            }else {
                return nil
            }
        }
        set {
            userDefaults.set( newValue , forKey: SELECTED_COUNTRY )
        }
    }
    
    
}

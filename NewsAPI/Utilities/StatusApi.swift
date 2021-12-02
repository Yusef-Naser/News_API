//
//  StatusAPI.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

protocol StatusApi : AnyObject {
    func showLoading ()
    func hideLoading()
    func showMessage (message : String)
}

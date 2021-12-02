//
//  SnackBar.swift
//  ToDoList
//
//  Created by Yusef Naser on 20/11/2021.
//

import UIKit

class SnackBar : UIView {
    
    private let labelText : UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 20)
        return l
    }()
    
    static var instance = SnackBar()
    
    private init() {
        super.init(frame: .zero)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    private func initViews () {
        addViews()
        self.backgroundColor = UIColor.black
    }
    
    private func addViews () {
        
        addSubview(labelText)
        labelText.anchor(top: topAnchor , leading: leadingAnchor , bottom: safeAreaLayoutGuide.bottomAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16 )
        
    }
    
    func showSnackBar (view : UIView , text : String? ) {
        
        labelText.text = text
        view.addSubview(self)
        self.anchor( leading: view.leadingAnchor , bottom: view.bottomAnchor , trailing: view.trailingAnchor , height: 100 )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
            self.removeFromSuperview()
        }
        
    }
    
}

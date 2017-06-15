//
//  CorporationButton.swift
//  CorporationExample
//
//  Created by Fernando Moya De Rivas on 14/6/17.
//  Copyright © 2017 Fernando Moya De Rivas. All rights reserved.
//

import UIKit

class CorporationButton: UIButton {

    private let darkOrange = UIColor.orange
    private let lightOrange = UIColor.orange.withAlphaComponent(0.05)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var color : UIColor? {
        didSet {
            initialize()
        }
    }
    
    func buttonTouchDown() {
        backgroundColor = color
    }
    
    func buttonTouchUp() {
        backgroundColor = UIColor.clear
    }
    
    func initialize () {
        layer.cornerRadius = 5
        layer.borderWidth = 2.0
        layer.borderColor = color?.cgColor
        backgroundColor = UIColor.clear
        
//        tintColor = color
        
        clipsToBounds = true
        
        addTarget(self, action: #selector(buttonTouchDown), for: UIControlEvents.touchDown)
        addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchUpInside)
        addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragOutside)
        addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragExit)

        
        tintColor = color?.withAlphaComponent(0.5)

        
    }
    
}

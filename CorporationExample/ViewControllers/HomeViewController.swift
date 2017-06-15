//
//  HomeViewController.swift
//  CorporationExample
//
//  Created by Fernando Moya De Rivas on 13/6/17.
//  Copyright © 2017 Fernando Moya De Rivas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var newRequestButton: UIButton! {
        didSet {
            newRequestButton.layer.cornerRadius = 5.0
            newRequestButton.layer.borderWidth = 2.0
            newRequestButton.layer.borderColor = UIColor.orange.cgColor
            newRequestButton.titleLabel?.numberOfLines = 0

            newRequestButton.addTarget(self, action: #selector(buttonTouchDown), for: UIControlEvents.touchDown)
            newRequestButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchUpInside)
            newRequestButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragOutside)
            newRequestButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragExit)
        }
    }
    
    func buttonTouchDown(sender: UIButton) {
        sender.backgroundColor = UIColor.orange
    }
    
    func buttonTouchUp(sender: UIButton) {
        sender.backgroundColor = UIColor.orange.withAlphaComponent(0.05)
    }
    
    @IBOutlet weak var otherActionButton: UIButton! {
        didSet {
            otherActionButton.layer.cornerRadius = 5.0
            otherActionButton.layer.borderWidth = 2.0
            otherActionButton.layer.borderColor = UIColor.orange.cgColor
            otherActionButton.titleLabel?.numberOfLines = 0
            
            otherActionButton.addTarget(self, action: #selector(buttonTouchDown), for: UIControlEvents.touchDown)
            otherActionButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchUpInside)
            otherActionButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragOutside)
            otherActionButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragExit)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

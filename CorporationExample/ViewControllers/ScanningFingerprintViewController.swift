//
//  ScanningFingerprintViewController.swift
//  CorporationExample
//
//  Created by Fernando Moya De Rivas on 13/6/17.
//  Copyright © 2017 Fernando Moya De Rivas. All rights reserved.
//

import UIKit

class ScanningFingerprintViewController: UIViewController {

    @IBOutlet weak var scanningLabel: UILabel!

    private var count = 0
    private var helloWorldTimer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        helloWorldTimer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(incrementPoint), userInfo: nil, repeats: true)
        
    }
    
    func incrementPoint () {
        if count == 8 {
            helloWorldTimer?.invalidate()
            
            let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
            let viewController = homeStoryboard.instantiateViewController(withIdentifier: "HomeNavigationController")
            self.show(viewController, sender: nil)
        }
        
        if count % 4 != 0 {
            scanningLabel.text = scanningLabel.text!.appending(".")
        } else {
            scanningLabel.text = scanningLabel.text!.replacingOccurrences(of: ".", with: "")
        }
        count += 1
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

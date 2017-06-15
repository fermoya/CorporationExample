//
//  NewRequestContentViewController.swift
//  CorporationExample
//
//  Created by Fernando Moya De Rivas on 14/6/17.
//  Copyright © 2017 Fernando Moya De Rivas. All rights reserved.
//

import UIKit

protocol NewRequestContentDelegate {
    func didSelectPageAtIndex(_ index: Int)
}

class NewRequestContentViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private var info : [Int : [String]] = [
        1 : ["Description 1", "Description 2", "Description 3"],
        2 : ["Comments 4", "Comments 5", "Comments 6"],
        3 : ["Contact 7", "Contact 8", "Contact 9"]
    ]
    
    var delegate: NewRequestContentDelegate?
    var request: Request?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch indexSelected {
        case 1:
            self.view.backgroundColor = UIColor.cyan
            continueButton.color = UIColor.blue
            hintLabel.text = NSLocalizedString("NEW_REQ_HINT_LABEL", comment: "")
            continueButton.setTitle(NSLocalizedString("NEW_REQ_CONTINUE_BUTTON", comment: ""), for: .normal)
        case 2:
            self.view.backgroundColor = UIColor.green
            continueButton.color = UIColor.purple
            hintLabel.text = NSLocalizedString("NEW_REQ_HINT_LABEL", comment: "")
            continueButton.setTitle(NSLocalizedString("NEW_REQ_CONTINUE_BUTTON", comment: ""), for: .normal)
        default:
            self.view.backgroundColor = UIColor.orange
            continueButton.color = UIColor.red
            hintLabel.text = NSLocalizedString("NEW_REQ_HINT_LABEL", comment: "")
            continueButton.setTitle(NSLocalizedString("NEW_REQ_EXIT_BUTTON", comment: ""), for: .normal)
        }
    }
    
    var indexSelected : Int = 1

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueButtonTapped(_ sender: CorporationButton) {
        let row = optionsPickerView.selectedRow(inComponent: 0)
        switch indexSelected {
        case 1:
            request?.description = info[indexSelected]![row]
        case 2:
            request?.comments = info[indexSelected]![row]
        default:
            request?.contact = info[indexSelected]![row]
        }
        delegate?.didSelectPageAtIndex(indexSelected)
    }
    
    @IBOutlet weak var continueButton: CorporationButton!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var optionsPickerView: UIPickerView! {
        didSet {
            optionsPickerView.dataSource = self
            optionsPickerView.delegate = self
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return info[indexSelected]?[row]
    }

}

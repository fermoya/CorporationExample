//
//  NewRequestPageViewController.swift
//  CorporationExample
//
//  Created by Fernando Moya De Rivas on 14/6/17.
//  Copyright © 2017 Fernando Moya De Rivas. All rights reserved.
//

import UIKit

class NewRequestPageViewController: UIPageViewController, NewRequestContentDelegate {
    
    private var contentViewController: NewRequestContentViewController! {
        didSet {
            contentViewController?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swapPageWithIndex(0)
        setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
    }
    
    func didSelectPageAtIndex(_ index: Int) {
        if (index + 1 <= 3) {
            swapPageWithIndex(index)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }

    func swapPageWithIndex(_ index: Int) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let request = contentViewController?.request ?? Request(description: "", comments: "", contact: "")
        contentViewController = storyboard.instantiateViewController(withIdentifier: "PageContentViewController") as! NewRequestContentViewController
        contentViewController.request = request
        contentViewController.indexSelected = index + 1
        setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
    }
    
}

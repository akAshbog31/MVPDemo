//
//  BaseVc.swift
//  MVP Demo
//
//  Created by mac on 17/03/23.
//

import UIKit

class BaseVc: UIViewController {
    //MARK: - @IBOutlet
    
    //MARK: - Properties
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - @IBAction
    
    //MARK: - Functions
}

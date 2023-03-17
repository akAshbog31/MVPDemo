//
//  Ext+UIView.swift
//  DemoVIPER
//
//  Created by mac on 10/03/23.
//

import UIKit

extension UIView {
    func setShadow(shadowColor: UIColor){
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3
        self.clipsToBounds = false
    }
}

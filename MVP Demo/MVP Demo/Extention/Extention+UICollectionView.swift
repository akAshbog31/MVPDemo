//
//  Extention+UICollectionView.swift
//  Summit
//
//  Created by mac on 23/01/23.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerNib<cell : UICollectionViewCell>(cell : cell.Type){
        let nibName = String(describing: cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func deque<cell : UICollectionViewCell>(indexPath: IndexPath)-> cell{
        let identifier = String(describing: cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? cell
            else {fatalError("=====>Error in cell") }
        return cell
    }
}

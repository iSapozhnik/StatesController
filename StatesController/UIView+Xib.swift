//
//  UIView+Xib.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/21/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    static func loadFromNib() -> Self? {
        
        func instanceFromNib<T: UIView>() -> T? {
            
            return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
        }
        
        return instanceFromNib()
    }
}

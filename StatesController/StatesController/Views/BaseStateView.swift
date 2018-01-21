//
//  BaseStateView.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/19/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class BaseStateView: UIView {

    var config: StateConfig?
    var userAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    func configure(with config: StateConfig?) {
        self.config = config
        setupView()
    }
    
    func setupView() {
        
    }
}

//
//  NoDataStateView.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/21/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class NoDataStateView: BaseStateView {
    
    @IBOutlet weak var noDataIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override var alpha: CGFloat {
        didSet {
            
        }
    }
    
    override func setupView() {
        super.setupView()
        
        noDataIcon.image = config?.image
        titleLabel.text = config?.title
        messageLabel.text = config?.message
    }
}

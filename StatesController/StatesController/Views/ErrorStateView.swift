//
//  ErrorStateView.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/19/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class ErrorStateView: BaseStateView {
    @IBOutlet weak var errorIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    override func setupView() {
        super.setupView()
        
        errorIcon.image = config?.image
        titleLabel.text = config?.title
        messageLabel.text = config?.message
        
        retryButton.isHidden = config?.userAction == nil
    }
    
    @IBAction func retryTap() {
        config?.userAction?()
    }
}

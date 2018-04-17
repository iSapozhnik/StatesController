//
//  NoDataStateView.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/21/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class NoDataStateView: UIView {
    
    @IBOutlet var noDataIcon: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!

    
    func setupView(icon: UIImage, title: String, message: String) {
        noDataIcon.image = icon
        titleLabel.text = title
        messageLabel.text = message
    }
}

//
//  ErrorStateView.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/19/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class ErrorStateView: UIView {
    @IBOutlet var errorIcon: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var retryButton: UIButton!

    fileprivate var retry: (() -> ())?
    
    func setupView(icon: UIImage, title: String, message: String, retry: @escaping () -> () = {}) {
        errorIcon.image = icon
        titleLabel.text = title
        messageLabel.text = message
        self.retry = retry
    }
    
    @IBAction func retryTap() {
        retry?()
    }
}

//
//  UIView+Embed.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/21/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import Foundation
import  UIKit

extension UIView {
    func embedSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view)
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor),
            self.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        layoutIfNeeded()
    }
}

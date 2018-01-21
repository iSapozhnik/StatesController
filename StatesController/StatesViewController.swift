//
//  StatesViewController.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/21/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class StatesViewController: UIViewController, ViewStateProtocol {
    struct Config: StateConfig {
        var title: String?
        var message: String?
        var image: UIImage?
        var userAction: (() -> Void)?
    }
    
    var errorConfig: StateConfig?
    var loadingConfig: StateConfig?
    var noDataConfig: StateConfig?
    
    var loadingView: UIView? {
        let view = LoadingStateView.loadFromNib()
        view?.configure(with: loadingConfig)
        return view
    }
    
    var errorView: UIView? {
        let view = ErrorStateView.loadFromNib()
        view?.configure(with: errorConfig)
        return view
    }
    
    var noDataView: UIView? {
        let view = NoDataStateView.loadFromNib()
        view?.configure(with: noDataConfig)
        return view
    }
}

//
//  ViewStateProtocol.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/19/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import Foundation
import UIKit

enum StatesType: String {
    case error = "error"
    case noData = "empty"
    case loading = "loading"
    case none = "none"
}

protocol StateConfig {
    var title: String? { get }
    var message: String? { get }
    var image: UIImage? { get }
}

protocol ViewStateProtocol: class {
    var stateHandler: StateHandler? { get }
    
    var loadingView: UIView? { get }
    var errorView: UIView? { get }
    var noDataView: UIView? { get }
    
    var loadingConfig: StateConfig? { get }
    var errorConfig: StateConfig? { get }
    var noDataConfig: StateConfig? { get }
    
    var userAction: (() -> Void)? { get }
    
    func switchState(_ state: StatesType)
}

extension ViewStateProtocol where Self: UIViewController {
    var stateHandler: StateHandler? {
        return StateHandler.shared
    }
    
    func switchState(_ state: StatesType) {
        
        switch state {
        case .loading:
            stateHandler?.addView(loadingView!, forState: StatesType.loading.rawValue, superview: view)
        case .error:
            stateHandler?.addView(errorView!, forState: StatesType.error.rawValue, superview: view)
        case .noData:
            stateHandler?.addView(noDataView!, forState: StatesType.noData.rawValue, superview: view)
        default:
            stateHandler?.removeAllViews()
        }
    }
}

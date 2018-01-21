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
    
    func switchState(_ state: StatesType, superview: UIView?)
}

extension ViewStateProtocol {
    func switchState(_ state: StatesType, superview: UIView? = nil) {
        return switchState(state, superview: superview)
    }
}

extension ViewStateProtocol where Self: UIViewController {
    var stateHandler: StateHandler? {
        return StateHandler.shared
    }
    
    func switchState(_ state: StatesType, superview: UIView?) {
        
        switch state {
        case .loading:
            stateHandler?.switchView(loadingView!, forState: StatesType.loading.rawValue, superview: superview ?? view)
        case .error:
            stateHandler?.switchView(errorView!, forState: StatesType.error.rawValue, superview: superview ?? view)
        case .noData:
            stateHandler?.switchView(noDataView!, forState: StatesType.noData.rawValue, superview: superview ?? view)
        default:
            stateHandler?.removeAllViews()
        }
    }
}

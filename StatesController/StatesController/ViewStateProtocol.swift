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

struct StateConfig {
    var title: String?
    var message: String?
    var image: UIImage?
    var userAction: (() -> Void)?
}

protocol ViewStatePlaceholder {
    func configure(with config: StateConfig?)
}

extension ViewStatePlaceholder where Self: UIView {}

protocol ViewStateProtocol: class {
    var stateHandler: StateHandler? { get }
    
    var loadingView: ViewStatePlaceholder? { get set }
    var errorView: ViewStatePlaceholder? { get set }
    var noDataView: ViewStatePlaceholder? { get set }
    
    func switchState(_ state: StatesType, config: StateConfig?, superview: UIView?, animated: Bool)
}

extension ViewStateProtocol {
    func switchState(_ state: StatesType, config: StateConfig? = nil, superview: UIView? = nil, animated: Bool = true) {
        return switchState(state, config: config, superview: superview, animated: animated)
    }
}

extension ViewStateProtocol where Self: UIViewController {
    var stateHandler: StateHandler? {
        return StateHandler.shared
    }
    
    func switchState(_ state: StatesType, config: StateConfig?, superview: UIView?, animated: Bool) {
        
        switch state {
        case .loading:
            loadingView?.configure(with: config)
            stateHandler?.switchView(loadingView as? UIView, forState: StatesType.loading.rawValue, superview: superview ?? view, animated: animated)
        case .error:
            errorView?.configure(with: config)
            stateHandler?.switchView(errorView as? UIView, forState: StatesType.error.rawValue, superview: superview ?? view, animated: animated)
        case .noData:
            noDataView?.configure(with: config)
            stateHandler?.switchView(noDataView as? UIView, forState: StatesType.noData.rawValue, superview: superview ?? view, animated: animated)
        default:
            stateHandler?.removeAllViews(animated: true)
        }
    }
}

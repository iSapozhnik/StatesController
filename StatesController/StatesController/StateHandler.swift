//
//  StateHandler.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/19/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import Foundation
import UIKit

class StateHandler<State: Hashable> {

    private weak var currentView: UIView?
    private weak var view: UIView?
    private var registeredStates: [State: UIView?] = [:]
    private var state: State?

    init(_ view: UIView, states: (state: State, view: UIView?)...) {
        self.view = view
        for item in states {
            item.view?.alpha = 0
            registeredStates[item.state] = item.view
        }
    }

    deinit {
        removeCurrentView(animated: false)
    }

    public func switchView(to state: State, animated: Bool = true) {
        guard self.state != state else { return }
        guard let nv = registeredStates[state] else { return }
        guard let newView = nv else {
            self.state = state
            return removeCurrentView(animated: animated)
        }
        
        defer {
            self.currentView = newView
            self.state = state
        }

        show(view: newView, animated: animated)
    }

    private func removeCurrentView(animated: Bool) {
        let currentView = self.currentView
        self.currentView = nil
        UIView.animate(withDuration: animated ? 0.3 : 0, animations: {
            currentView?.alpha = 0
        }) { _ in
            currentView?.removeFromSuperview()
        }
    }

    private func show(view: UIView, animated: Bool) {
        self.view?.embedSubview(view)

        guard let currentView = currentView else {
            return UIView.animate(withDuration: animated ? 0.3 : 0.0){
                view.alpha = 1
            }
        }
        view.alpha = 1
        UIView.transition(from: currentView, to: view, duration: animated ? 0.3 : 0.0, options: .transitionCrossDissolve) { _ in
            currentView.removeFromSuperview()
        }
    }
    
}

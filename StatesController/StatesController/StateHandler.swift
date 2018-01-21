//
//  StateHandler.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/19/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import Foundation
import UIKit

class StateHandler {
    
    static let shared = StateHandler()
    var views: [String: UIView] = [:]
    var currentView: UIView?
    
    public func switchView(_ view: UIView, forState state: String, superview: UIView, animated: Bool) {
        
        defer {
            currentView = view
        }
        
        views[state] = view
        
        guard let currentView = self.currentView else {
            view.alpha = 0.0
            superview.embedSubview(view)
            UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: {
                view.alpha = 1.0
            })
            return
        }
        
        UIView.transition(from: currentView, to: view, duration: animated ? 0.3 : 0.0, options: .transitionCrossDissolve) { flag in
            superview.embedSubview(view)
        }
    }
    
    public func removeAllViews(animated: Bool) {
        UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: {
            self.currentView?.alpha = 0
        }) { flag in
            for (_, view) in self.views {
                view.removeFromSuperview()
            }
            self.views = [:]
            self.currentView = nil
        }
    }
}

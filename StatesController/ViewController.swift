//
//  ViewController.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/19/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button: UIButton!

    var errorView = ErrorStateView.loadFromNib()
    var noDataView = NoDataStateView.loadFromNib()
    var loadingView = LoadingStateView.loadFromNib()
    lazy var mainStateHandler = DefaultStateHandler(self.view, states: (.error, self.errorView), (.noData, self.noDataView), (.loading, self.loadingView), (.none, nil))

    lazy var buttonStateHandler = ButtonStateHandler(self.button, states: (.loading, LoadingStateView.loadFromNib()), (.none, nil))

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainStateHandler.switchView(to: .loading, animated: false)
        doAfter(3) {
            self.mainStateHandler.switchView(to: .none)
        }
    }
    
    @IBAction func showLoading(_ sender: Any?) {
        mainStateHandler.switchView(to: .loading)
        doAfter(3) { 
            self.mainStateHandler.switchView(to: .none)
        }
    }
    
    @IBAction func showError(_ sender: Any) {
        mainStateHandler.switchView(to: .error)
        doAfter(3) {
            self.mainStateHandler.switchView(to: .none)
        }
    }
    
    @IBAction func showNoData(_ sender: Any) {
        noDataView?.setupView(icon: #imageLiteral(resourceName: "error"), title: "Oops something went wrong.", message: "We are really sorry, but something went wrong. We are working to fix this poblem.")
        mainStateHandler.switchView(to: .noData)
        doAfter(3) {
            self.mainStateHandler.switchView(to: .none)
        }
    }
    
    @IBAction func showLoadingThenError(_ sender: Any) {
        mainStateHandler.switchView(to: .loading)
        doAfter(3) { 
            self.showError(sender)
        }
    }
    
    @IBAction func showLoadingTheNoData(_ sender: Any) {
        mainStateHandler.switchView(to: .loading)
        doAfter(3) {
            self.showNoData(sender)
        }
    }
    
    @IBAction func showErrorWithretry(_ sender: Any) {
        errorView?.setupView(icon: #imageLiteral(resourceName: "error"), title: "Oops something went wrong.", message: "We are really sorry, but something went wrong. We are working to fix this poblem.", retry: {
            self.mainStateHandler.switchView(to: .loading)
            doAfter(3) {
                self.mainStateHandler.switchView(to: .none)
            }
        })
        mainStateHandler.switchView(to: .error)
    }
    
    @IBAction func showLoadingInside(_ sender: Any) {
        buttonStateHandler.switchView(to:.loading)
        doAfter(3) {
            self.buttonStateHandler.switchView(to:.none)
        }
    }
}


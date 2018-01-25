//
//  ViewController.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/19/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewStateProtocol {
    
    var loadingView: ViewStatePlaceholder? = LoadingStateView.loadFromNib()
    var errorView: ViewStatePlaceholder? = ErrorStateView.loadFromNib()
    var noDataView: ViewStatePlaceholder? = NoDataStateView.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switchState(.loading, animated: false)
        doAfter(3) {
            self.switchState(.none)
        }
    }
    
    @IBAction func showLoading(_ sender: Any?) {
        switchState(.loading)
        doAfter(3) { 
            self.switchState(.none)
        }
    }
    
    @IBAction func showError(_ sender: Any) {
        let errorConfig = Config(title: "Oops something went wrong.", message: "We are really sorry, but something went wrong. We are working to fix this poblem.", image: #imageLiteral(resourceName: "error"), userAction: nil)
        self.switchState(.error, config: errorConfig)
        doAfter(3) {
            self.switchState(.none)
        }
    }
    
    @IBAction func showNoData(_ sender: Any) {
        let noDataConfig = Config(title: "No search results.", message: "We are sorry, but we couldn't fine any reaults matching your search criteria.", image: #imageLiteral(resourceName: "noData"), userAction: nil)
        self.switchState(.noData, config: noDataConfig)
        doAfter(3) {
            self.switchState(.none)
        }
    }
    
    @IBAction func showLoadingThenError(_ sender: Any) {
        switchState(.loading)
        doAfter(3) { 
            self.showError(sender)
        }
    }
    
    @IBAction func showLoadingTheNoData(_ sender: Any) {
        switchState(.loading)
        doAfter(3) {
            self.showNoData(sender)
        }
    }
    
    @IBAction func showErrorWithretry(_ sender: Any) {
        let errorConfig = Config(title: "Oops something went wrong.", message: "We are really sorry, but something went wrong. We are working to fix this poblem.", image: #imageLiteral(resourceName: "error"), userAction: {
            self.switchState(.loading)
            self.doAfter(3) {
                self.switchState(.none)
            }
        })
        self.switchState(.error, config: errorConfig)
    }
    
    @IBAction func showLoadingInside(_ sender: Any) {
        switchState(.loading, superview: sender as! UIButton)
        doAfter(3) {
            self.switchState(.none)
        }
    }
    
    private func doAfter(_ interval: TimeInterval, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
        }
    }
}


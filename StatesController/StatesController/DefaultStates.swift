//
//  ViewStateProtocol.swift
//  StatesController
//
//  Created by Ivan Sapozhnik on 1/19/18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import Foundation

enum DefaultStates {
    case error
    case noData
    case loading
    case none
}

typealias DefaultStateHandler = StateHandler<DefaultStates>

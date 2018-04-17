//
//  ButtonStates.swift
//  StatesController
//
//  Created by Dmitry Poznukhov on 17.04.18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import Foundation

enum ButtonStates {
    case loading
    case none
}

typealias ButtonStateHandler = StateHandler<ButtonStates>

//
//  After.swift
//  StatesController
//
//  Created by Dmitry Poznukhov on 17.04.18.
//  Copyright © 2018 Ivan Sapozhnik. All rights reserved.
//

import Foundation

func doAfter(_ interval: TimeInterval, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
        completion()
    }
}

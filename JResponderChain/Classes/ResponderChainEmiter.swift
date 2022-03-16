//
//  ResponderChainEmiter.swift
//  JResponderChain
//
//  Created by jingxuelong on 03/15/2022.
//  Copyright (c) 2022 jingxuelong. All rights reserved.
//

import Foundation
import class UIKit.UIResponder
import class UIKit.UIViewController

public extension ResponderChainEmiter where Self: UIResponder {
    func emitRouterEvent(_ event: ResponderChainEvent) {
        var responder = next

        while responder != nil {
            if responder!.isKind(of: UIViewController.self), let rcp = responder as? ResponderChainStorage {
                rcp._events.onNext(event)
                return
            }

            responder = responder?.next
        }
    }
}

extension UIResponder: ResponderChainEmiter {}

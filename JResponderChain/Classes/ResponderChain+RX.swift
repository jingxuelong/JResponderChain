//
//  ResponderChain+RX.swift
//  JResponderChain
//
//  Created by jingxuelong on 03/15/2022.
//  Copyright (c) 2022 jingxuelong. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public extension Reactive where Base: UIResponder {
    var routerEvents: Binder<ResponderChainEvent> {
        return Binder(self.base) { responder, event in
            responder.emitRouterEvent(event)
        }
    }
}

//
//  ResponderChainRouter.swift
//  JResponderChain
//
//  Created by jingxuelong on 03/15/2022.
//  Copyright (c) 2022 jingxuelong. All rights reserved.
//

import Foundation
import RxSwift

public extension ResponderChainWrapper where Self: ResponderChainStorage {
    var events: Observable<Event> {
        return _events.compactMap { $0 as? Event }.share()
    }
}

public extension ResponderChainStorage {
    var _events: PublishSubject<ResponderChainEvent> {
        return lazyInstanceObservable(&rcp_events_key) { PublishSubject<ResponderChainEvent>() }
    }

    private func lazyInstanceObservable<T: AnyObject>(_ key: UnsafeRawPointer, createCachedObservable: () -> T) -> T {
        if let value = objc_getAssociatedObject(self, key) {
            return value as! T
        }

        let observable = createCachedObservable()

        objc_setAssociatedObject(self, key, observable, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        return observable
    }
}

private var rcp_events_key: UInt8 = 0

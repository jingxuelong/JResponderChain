//
//  ResponderChain.swift
//  JResponderChain
//
//  Created by jingxuelong on 03/15/2022.
//  Copyright (c) 2022 jingxuelong. All rights reserved.
//

import Foundation
import RxSwift

/// 事件
public protocol ResponderChainEvent {}

/// 发出事件方实现
public protocol ResponderChainEmiter {}

/// 接收事件方实现
public typealias ResponderChainRouter = ResponderChainWrapper & ResponderChainStorage

public protocol ResponderChainWrapper {
    associatedtype Event: ResponderChainEvent

    var events: Observable<Event> { get }
}

public protocol ResponderChainStorage {}

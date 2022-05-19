//
//  HoCoin.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import Foundation

struct HoCoin: Hashable, Codable {
    var coinId: Int
    var icon: String
    var name: String
    var balance: Int
    var transactions: [HoTrade]
    
}

struct HoTrade: Codable {
    var tradeId: Int
    var time: Int
    var amount: Int
    var desc: String
}

//
//  HoCoin.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import Foundation


struct HoCoinSummary: Codable {
    var coinId: Int
    var icon: String
    var name: String
    var balance: Int
    
    static let summaryDefault = HoCoinSummary(coinId: 0, icon: "", name: "", balance: 0)
}

struct HoCoinDetail: Codable {
    var coinId: Int
    var icon: String
    var name: String
    var balance: Int
    var transactions: [HoTrade]
    
    static let detailDefault = HoCoinDetail(coinId: 0,
                                                icon: "",
                                                name: "",
                                                balance: 0,
                                                transactions: [])
}

struct HoTrade: Codable {
    var tradeId: Int
    var time: Int
    var amount: Int
    var desc: String
}

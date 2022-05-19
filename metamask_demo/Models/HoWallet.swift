//
//  HoWallet.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import Foundation


struct HoWallet: Codable {
    var accountId: String
    var accountName: String
    var accountIcon: String
    var accountBalance: Int
    var coins: [HoCoinSummary]
    
    static let defaultWallet = HoWallet(accountId: "",
                                        accountName: "",
                                        accountIcon: "",
                                        accountBalance: 0,
                                        coins: [])
}


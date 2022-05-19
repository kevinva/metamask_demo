//
//  HoWallet.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import Foundation


struct HoWallet: Hashable, Codable {
    var accountId: String
    var accountName: String
    var accountIcon: String
    var accountBalance: Int
    var coins: [HoCoin]
}

//
//  HoCoinCell.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/20.
//

import SwiftUI

struct HoCoinCell: View {
    var coinSummary: HoCoinSummary
    var imagePlaceHolder: String = ""
    
    init(_ summary: HoCoinSummary) {
        coinSummary = summary
        
        if (HoWalletService.isEth(for: coinSummary.coinId)) {
            imagePlaceHolder = "eth_icon"
        } else if (HoWalletService.isDoge(for: coinSummary.coinId)) {
            imagePlaceHolder = "doge_icon"
        } else if (HoWalletService.isLite(for: coinSummary.coinId)) {
            imagePlaceHolder = "lite_icon"
        }
    }
    
    var body: some View {
        HStack {
            if let iconUrl = URL(string: coinSummary.icon) {

                HoUrlImageView(url: iconUrl, placeHolder: imagePlaceHolder)
                    .frame(width: 40, height: 40)
                    .cornerRadius(20.0)
                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 0))
            } else {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(coinSummary.name)
                    .font(.title2)
                Text("$\(coinSummary.balance)")
                    .font(.system(size: 14))
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "chevron.forward").foregroundColor(.gray)
                .padding()
            
        }

    }
}

struct HoCoinCell_Previews: PreviewProvider {
    static var previews: some View {
        HoCoinCell(HoCoinSummary.summaryDefault)
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 70))
    }
}

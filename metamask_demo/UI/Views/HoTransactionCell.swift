//
//  HoTransactionCell.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/20.
//

import SwiftUI

struct HoTransactionCell: View {
    var tradeData: HoTrade
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15, content: {
                Text(tradeData.desc)
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                Text("2018-10-10")
                    .font(.system(size: 12))
                    .padding(EdgeInsets(top: 1, leading: 15, bottom: 10, trailing: 0))
            })
            
            Spacer()
            
            Text("$\(tradeData.amount)")
                .font(.system(size: 20))
                .bold()
                .padding()
        }
    }
}

struct HoTransactionCell_Previews: PreviewProvider {
    static var previews: some View {
        HoTransactionCell(tradeData: HoTrade.tradeDefault)
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 60))
    }
}

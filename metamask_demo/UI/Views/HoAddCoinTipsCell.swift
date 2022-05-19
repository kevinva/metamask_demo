//
//  HoAddCoinTipsCell.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/20.
//

import SwiftUI

struct HoAddCoinTipsCell: View {
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center) {
                Text("Don't see your token?")
                Button(action: {}) {
                    Text("Import Tokens")
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Spacer()
        }

    }
}

struct HoAddCoinTipsCell_Previews: PreviewProvider {
    static var previews: some View {
        HoAddCoinTipsCell()
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 70))
    }
}

//
//  HoAddCoinTipsCell.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/20.
//

import SwiftUI

struct HoAddCoinTipsCell: View {
    @Binding var isTap: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center) {
                Text("Don't see your token?")
                Button(action: {
                    isTap.toggle()
                }) {
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
    @State static var isTap: Bool = false
    
    static var previews: some View {
        HoAddCoinTipsCell(isTap: $isTap)
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 70))
    }
}

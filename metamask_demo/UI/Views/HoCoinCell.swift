//
//  HoCoinCell.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/20.
//

import SwiftUI

struct HoCoinCell: View {
    var body: some View {
        HStack {
            Image("eth_icon")
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFit()
                .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 0))
            
            VStack(alignment: .leading) {
                Text("0 ETH")
                    .font(.title2)
                Text("$0")
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
        HoCoinCell()
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 70))
    }
}

//
//  HoNavTitleView.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/20.
//

import SwiftUI

struct HoNavTitleView: View {
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack {
            Text(title).font(.title2)
            
            HStack {
                Text("").frame(width: 10, height: 10, alignment: .center).background(Color.green).cornerRadius(5.0)
                Text(subTitle).font(.subheadline)
            }
        }
        
    }
}

struct HoNavTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HoNavTitleView(title: "hah", subTitle: "yeah")
    }
}

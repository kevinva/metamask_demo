//
//  HoAccountButon.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/20.
//

import SwiftUI

struct HoAccountButon: View {
    var imageName: String
    var title: String
    
    var body: some View {
        Button(action: {}) {
            VStack {
                Image(systemName: imageName)
                    .frame(width: 30, height: 30)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                
                Text(title).font(.system(size: 12))
                    .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}

struct HoAccountButon_Previews: PreviewProvider {
    static var previews: some View {
        HoAccountButon(imageName: "", title: "")
    }
}

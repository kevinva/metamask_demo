//
//  HoCoinAddingView.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import SwiftUI

struct HoCoinAddingView: View {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var isShowCoinAddingView: Bool
    @State private var searchStr: String = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Button(action: {
                    isShowCoinAddingView = false
                }, label: {
                    Image(systemName: "chevron.backward")
                })
                .padding()
                
                Spacer()
                
                HoNavTitleView(title: "Import Tokens", subTitle: "Ethereum Main Network")
                
                Spacer()
                
                // 这个空Button只是为了让HoNavTitleView居中
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("")
                })
                .background(Color.clear)
                .padding()
                
            }
            .frame(width: UIScreen.main.bounds.width, height: 60)
            
            HStack(alignment: .top, spacing: 0) {
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundColor(.blue)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
    

                Text("New! Improved token detection is available on Ethereum Mainnet as an experimental feature. ")
                    .font(.system(size: 14))

                + Text("Enable it from Settings.")
                    .foregroundColor(.blue)
                    .font(.system(size: 14))
            }
            .padding()
            
            HStack(alignment: .center, spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .padding()
                    .foregroundColor(.gray)

                TextField("Search Tokens", text: $searchStr)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 10))
            }
            .overlay(RoundedRectangle(cornerRadius: 6, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).stroke(Color.gray, lineWidth: 2))
            .padding()
            
            HStack(alignment: .center, spacing: 0) {
                
                Spacer()
                
                Button(action: {
                    isShowCoinAddingView = false
                }, label: {
                    Text("CANCEL")
                        .foregroundColor(.gray)
                })
                .frame(width: 100, height: 40)
                .overlay(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).stroke(Color.gray, lineWidth: 1))
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("IMPORT")
                        .foregroundColor(.blue)
                })
                .frame(width: 100, height: 40)
                .overlay(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).stroke(Color.blue, lineWidth: 1))
                .padding()
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct HoCoinAddingView_Previews: PreviewProvider {
    @State static var isTap: Bool = false
    
    static var previews: some View {
        HoCoinAddingView(isShowCoinAddingView: $isTap)
    }
}

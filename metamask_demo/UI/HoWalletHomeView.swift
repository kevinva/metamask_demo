//
//  HoWalletHomeView.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import SwiftUI

struct HoWalletHomeView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Button(action: {}) {
                    Image(systemName: "ellipsis.circle")
                }.frame(width: 44, height: 44)
                
                Spacer()
                
                HoNavTitleView(title: "Wallet", subTitle: "Ethereum Main Network")
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "camera")
                }.frame(width: 44, height: 44)
                
                
            }.frame(width: UIScreen.main.bounds.width, height: 60)
            
            HoUrlImageView(url: URL(string: "https://avatars.githubusercontent.com/u/1279449?s=400&u=e81d6d9384a279faba5ba8ef5d6ff55d286ad6ba&v=4")!)
                .frame(width: 80, height: 80, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                .padding()
            
            Text("Account 1").font(.title)
            
            Text("$0")
                .font(.system(size: 12))
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            
            Text("0x8129318293")
                .frame(width: 200, height: 36)
                .background(Color(red: 100.0 / 255, green: 149.0 / 255, blue: 237.0 / 255))
                .cornerRadius(18)
                .padding()
            
            HStack {
                Spacer()
                HoAccountButon(imageName: "arrow.turn.down.right", title: "Receive")
                Spacer()
                HoAccountButon(imageName: "arrow.turn.up.right", title: "Buy")
                Spacer()
                HoAccountButon(imageName: "arrow.turn.left.down", title: "Send")
                Spacer()
                HoAccountButon(imageName: "arrow.uturn.left", title: "Swap")
                Spacer()
            }

            // 去掉tableView分隔线，要适配iOS版本
            if #available(iOS 14.0, *) {
                ScrollView {
                    LazyVStack(content: {
                        ForEach(0..<3, id: \.self) { count in
                            HoCoinCell()
                        }
                        
                        HoAddCoinTipsCell()
                    })
                }
            } else {
                List {
                    ForEach(0..<3) { index in
                        HoCoinCell()
                    }
                
                    HoAddCoinTipsCell()
                }
                .modifier(HoListRemoveSeparator())
            }

            Spacer()
        }
    }
}

struct HoListRemoveSeparator: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear(perform: {
                UITableView.appearance().tableFooterView = UIView()
                UITableView.appearance().separatorStyle = .none
            })
            .onDisappear(perform: {
                UITableView.appearance().tableFooterView = nil
                UITableView.appearance().separatorStyle = .singleLine
            })
    }
}

struct HoWalletHomeView_Previews: PreviewProvider {
    static var previews: some View {
        HoWalletHomeView()
    }
}

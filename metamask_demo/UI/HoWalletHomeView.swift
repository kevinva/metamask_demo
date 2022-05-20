//
//  HoWalletHomeView.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import SwiftUI

struct HoWalletHomeView: View {
    @StateObject private var service: HoWalletService = HoWalletService()
    
    var body: some View {
        NavigationView {
            VStack {
                // 顶部：导航栏
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
                
                // 中部：账户icon，名字，余额，账户Id
                if let iconUrl = URL(string: service.wallet.accountIcon) {
                    HoUrlImageView(url: iconUrl)
                        .frame(width: 80, height: 80, alignment: .center)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                        .padding()
                } else {
                    ProgressView()
                        .frame(width: 80, height: 80, alignment: .center)
                }

                
                Text(service.wallet.accountName).font(.title)
                
                Text("$ \(service.wallet.accountBalance)")
                    .font(.system(size: 12))
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                
                Text(service.wallet.accountId)
                    .frame(width: 200, height: 36)
                    .background(Color(red: 100.0 / 255, green: 149.0 / 255, blue: 237.0 / 255))
                    .cornerRadius(18)
                    .padding()
                
                // 账户功能按钮
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

                // 底部：币种列表
                // 隐藏tableView分隔线，要适配iOS版本
                if #available(iOS 14.0, *) {
                    ScrollView {
                        LazyVStack(content: {
                            ForEach(service.wallet.coins, id: \.coinId) { coin in
                                NavigationLink(
                                    destination: HoCoinDetailView(),
                                    label: {
                                        HoCoinCell(coin)
                                    })
                            }

                            HoAddCoinTipsCell()
                        })
                    }
                } else {
                    List {
                        ForEach(service.wallet.coins, id: \.coinId) { coin in
                            NavigationLink(
                                destination: HoCoinDetailView(),
                                label: {
                                    HoCoinCell(coin)
                                })
                        }
                    
                        HoAddCoinTipsCell()
                    }
                    .modifier(HoListRemoveSeparator())
                }

                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            service.fetchData { errMsg in
                
            }
        }
    }
}

// 用于隐藏tableView分隔线
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

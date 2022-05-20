//
//  HoCoinDetailView.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import SwiftUI

struct HoCoinDetailView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var service = HoCoinDetailService()
    
    var body: some View {
        VStack {
            // 顶部：自定义导航栏
            HStack(alignment: .top, spacing: 0) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                })
                .padding()
                
                Spacer()
                
                HoNavTitleView(title: service.coinDetail.name, subTitle: "Ethereum Main Network")
                
                Spacer()
                
                // 这个空Button只是为了让HoNavTitleView居中
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("")
                })
                .background(Color.clear)
                .padding()
                
            }.frame(width: UIScreen.main.bounds.width, height: 60)
            
            // 中部：币种icon，名字，余额
            if let iconUrl = URL(string: service.coinDetail.icon) {
                HoUrlImageView(url: iconUrl)
                    .frame(width: 80, height: 80, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                    .padding()
            } else {
                ProgressView()
                    .frame(width: 80, height: 80, alignment: .center)
            }

            Text(service.coinDetail.name).font(.system(size: 30))
            
            Text("$\(service.coinDetail.balance)")
                .font(.system(size: 16))
                .padding()
            
            
            // 币种功能按钮
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
            
            Divider()

            if service.coinDetail.transactions.isEmpty {
                Spacer()

                Text("You have no transactions!")
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(.gray)

                Spacer()
            } else {
                // 底部：交易信息列表
                List {
                    ForEach(service.coinDetail.transactions, id: \.tradeId) { trade in

                        HoTransactionCell(tradeData: trade)
                    }
                }
                .listStyle(PlainListStyle())
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        .onAppear {
            // hoho_todo: 暂时写死币种详情数据。后续开发可考虑以币种ID等信息作为请求参数，获取指定币种详细信息
            service.fetchData { errMsg in
                
            }
        }
    }
}

struct HoCoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HoCoinDetailView()
    }
}

//
//  HoWalletService.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import Foundation

class HoWalletService: ObservableObject {
    @Published var wallet: HoWallet = HoWallet.defaultWallet
    
    let api = "http://rap2api.taobao.org/app/mock/data/2267369"
    
    func fetchData(_ completion: @escaping (String?) -> Void) {
        guard let url = URL(string: api) else {
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            
            guard err == nil else {
                DispatchQueue.main.async {
                    completion(err?.localizedDescription)
                }
            
                NSLog("error: \(String(describing: err?.localizedDescription))")
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion("something wrong")
                }
                
                NSLog("error: statusCode = \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion("data is nil")
                }
                
                NSLog("data is nil")
                return
            }
            
            DispatchQueue.main.async {
                do {
                    self.wallet = try JSONDecoder().decode(HoWallet.self, from: data)
                    completion(nil)
                } catch {
                    completion("data decode error")
                    NSLog("data decode error: \(error)")
                }
            }

        }
        task.resume()
        
    }
}

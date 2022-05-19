//
//  HoUrlImageView.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/19.
//

import SwiftUI

struct HoUrlImageView: View {

    @ObservedObject private var imageLoader: Loader
    
    var image: UIImage? {
        let result = imageLoader.data.flatMap(UIImage.init)
        return result
    }
    
    init(url: URL) {
        self.imageLoader = Loader(url)
    }

    var body: some View {
        VStack {
            if let uiImage = image  {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                EmptyView()
            }
        }
    }

}

final class Loader: ObservableObject {

    var task: URLSessionDataTask!
    @Published var data: Data? = nil

    init(_ url: URL) {
        task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        })
        task.resume()
    }
    deinit {
        task.cancel()
    }
    
}

struct HoUrlImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        HoUrlImageView(url: URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/d/d0/Dogecoin_Logo.png/150px-Dogecoin_Logo.png")!)
            .scaledToFill()
            .frame(width: 100, height: 100)
    }
}

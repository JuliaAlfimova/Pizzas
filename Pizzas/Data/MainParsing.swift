//
//  MainParsing.swift
//  Pizzas
//
//  Created by juliemoorled on 14.10.2022.
//

import UIKit

extension MenuVC {

    func getData() {
        let urlString = "https://run.mocky.io/v3/370c43c1-f903-472d-9262-31cab1087b20"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            do {
                let jsonData = try JSONDecoder().decode(JSONData.self, from: data)
                self.categories = jsonData.categories
                for category in self.categories {
                    for product in category.products {
                        self.products.append(Product(title: product.title, description: product.description, price: product.price, image_url: product.image_url, category: category))
                    }
                }
            } catch {
                print(error)
            }
        }.resume()
        tableView.reloadData()
        self.reloadInputViews()
    }

}

extension UIImageView {

    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }

}

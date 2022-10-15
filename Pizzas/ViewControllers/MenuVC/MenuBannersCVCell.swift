//
//  MenuBannersCVCell.swift
//  Pizzas
//
//  Created by juliemoorled on 13.10.2022.
//

import UIKit

final class BannerCell: UICollectionViewCell {

    static let cellIdentifier = "BannerCell"

    let bannerImageView = UIImageView()

    var data: BannersData? {
        didSet {
            guard let data = data else { return }
            bannerImageView.image = data.image
        }
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemGray6
        setUpBannerImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpBannerImageView() {
        contentView.addSubview(bannerImageView)
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        bannerImageView.layer.cornerRadius = 10
        bannerImageView.layer.masksToBounds = true
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.image = UIImage(named: "collectionview1")
        NSLayoutConstraint.activate([
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        bannerImageView.backgroundColor = .systemIndigo
    }
}

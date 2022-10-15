//
//  MenuBannersCollectionView.swift
//  Pizzas
//
//  Created by juliemoorled on 13.10.2022.
//

import UIKit

struct BannersData {
    var image: UIImage?
}

final class MenuBannersTVCell: UITableViewCell {

    static let cellIdentifier = "MenuBannersTVCell"

    let bannersCollectionView = UICollectionView(frame: .zero,
                                                 collectionViewLayout: UICollectionViewFlowLayout())
    let banners = [ BannersData(image: UIImage(named: "collectionview1")),
                        BannersData(image: UIImage(named: "collectionview2"))]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        bannersCollectionView.backgroundColor = .systemGray6
        backgroundColor = .systemGray6
        setUpBannersCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpBannersCollectionView() {
        contentView.addSubview(self.bannersCollectionView)
        bannersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bannersCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.cellIdentifier)
        NSLayoutConstraint.activate([
            bannersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bannersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bannersCollectionView.topAnchor.constraint(equalTo: topAnchor),
            bannersCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        setVCLayout()
        setVCDelegateAndDataSource()
    }

    private func setVCLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        bannersCollectionView.collectionViewLayout = layout
        bannersCollectionView.showsHorizontalScrollIndicator = false
    }

    private func setVCDelegateAndDataSource() {
        bannersCollectionView.delegate = self
        bannersCollectionView.dataSource = self
    }
    
}

extension MenuBannersTVCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width*0.8, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.cellIdentifier, for: indexPath) as? BannerCell ?? .init()
        cell.data = self.banners[indexPath.row]
        return cell
    }

}


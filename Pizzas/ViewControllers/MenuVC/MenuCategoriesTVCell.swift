//
//  MenuCategoriesCell.swift
//  Pizzas
//
//  Created by juliemoorled on 14.10.2022.
//

import UIKit

final class MenuCategoriesTVCell: UITableViewCell {

    static let cellIdentifier = "MenuCategoriesTVCell"

    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: UICollectionViewFlowLayout())
    var selectedCategoryNumber = 0
    var productsInCategory: [Int] = []

    var categories: [Category]? {
        didSet {
            guard let categories = categories else { return }
            categoryNames = []
            for category in categories {
                categoryNames.append(category.name)
                productsInCategory.append(category.products.count)
            }
            collectionView.reloadData()
        }
    }
    var categoryNames: [String] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .systemGray6
        backgroundColor = .systemGray6
        selectionStyle = .none
        setUpCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpCollectionView() {
        contentView.addSubview(self.collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuCategoriesCVCell.self, forCellWithReuseIdentifier: MenuCategoriesCVCell.cellIdentifier)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        setVCLayout()
        setVCDelegateAndDataSource()
    }

    private func setVCLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false

    }

    private func setVCDelegateAndDataSource() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension MenuCategoriesTVCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (categoryNames[indexPath.row].count) * 20
        return CGSize(width: CGFloat(width), height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCategoriesCVCell.cellIdentifier, for: indexPath) as? MenuCategoriesCVCell ?? .init()
        cell.category = self.categoryNames[indexPath.row]
        if indexPath.row == selectedCategoryNumber {
            cell.setUpSelectedCell()
        } else {
            cell.setUpUnselectedCell()
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategoryNumber = indexPath.row
        collectionView.reloadData()
        var productsBeforeCounter = 0
        for i in 0..<indexPath.row {
            productsBeforeCounter += productsInCategory[i]
        }
        (superview as? UITableView ?? .init()).selectRow(at: IndexPath(row: productsBeforeCounter+3, section: 0), animated: true, scrollPosition: .top)
    }

}

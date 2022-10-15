//
//  MenuCategoriesCVCell.swift
//  Pizzas
//
//  Created by juliemoorled on 14.10.2022.
//

import UIKit

final class MenuCategoriesCVCell: UICollectionViewCell {

    static let cellIdentifier = "MenuCategoriesCVCell"

    let frameView = UIView()
    let titleLabel = UILabel()

    var category: String? {
        didSet {
            guard let category = category else { return }
            titleLabel.text = category
        }
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemGray6
        setUpFrameView()
        setUpTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setUpFrameView() {
        addSubview(frameView)
        frameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            frameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            frameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            frameView.heightAnchor.constraint(equalToConstant: 38),
            frameView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        frameView.layer.cornerRadius = 20
        setUpUnselectedCell()
    }

    func setUpTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        setUpUnselectedCell()
    }

    func setUpSelectedCell() {
        titleLabel.textColor = .systemPink
        titleLabel.font = .systemFont(ofSize: 13, weight: .bold)
        frameView.layer.borderWidth = 0
        frameView.backgroundColor = UIColor.systemPink.withAlphaComponent(0.2)
    }

    func setUpUnselectedCell() {
        titleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        titleLabel.textColor = .systemPink.withAlphaComponent(0.4)
        frameView.backgroundColor = .clear
        frameView.layer.borderColor = UIColor.systemPink.withAlphaComponent(0.4).cgColor
        frameView.layer.borderWidth = 1
    }

}

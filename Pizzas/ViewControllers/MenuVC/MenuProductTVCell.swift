//
//  MenuProductTVCell.swift
//  Pizzas
//
//  Created by juliemoorled on 14.10.2022.
//

import UIKit

final class MenuProductTVCell: UITableViewCell {

    static let cellIdentifier = "MenuProductTVCell"

    let productImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let priceFrameView = UIView()

    var product: Product? {
        didSet {
            guard let product = product else { return }
            productImageView.downloaded(from: product.image_url)
            titleLabel.text = product.title
            descriptionLabel.text = product.description
            priceLabel.text = "от " + product.price + " руб"
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpProduct()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpProduct() {
        selectionStyle = .none
        backgroundColor = .systemBackground
        setUpProductImageView()
        setUpTitleLabel()
        setUpDescriptionLabel()
        setUpPrice()
    }

    func setUpProductImageView() {
        contentView.addSubview(self.productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            productImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor)
        ])
        productImageView.layer.cornerRadius = 20

    }

    func setUpTitleLabel() {
        contentView.addSubview(self.titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: productImageView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        titleLabel.text = "Загрузка"
        descriptionLabel.lineBreakMode = .byTruncatingTail
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        titleLabel.textColor = .label
    }

    func setUpDescriptionLabel() {
        contentView.addSubview(self.descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)

        ])
        descriptionLabel.numberOfLines = 4
        descriptionLabel.text = "Загрузка"
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.sizeToFit()
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .label
    }

    func setUpPrice() {
        contentView.addSubview(self.priceFrameView)
        priceFrameView.addSubview(priceLabel)
        priceFrameView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceFrameView.layer.cornerRadius = 6
        priceFrameView.layer.borderColor = UIColor.systemPink.cgColor
        priceFrameView.layer.borderWidth = 1
        NSLayoutConstraint.activate([
            priceFrameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            priceFrameView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            priceFrameView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            priceFrameView.heightAnchor.constraint(equalToConstant: 38),
            priceFrameView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.minimumScaleFactor = 0.5
        priceLabel.lineBreakMode = .byTruncatingTail
        priceLabel.font = .systemFont(ofSize: 13, weight: .regular)
        priceLabel.textColor = .systemPink
        priceLabel.text = "Загрузка"
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: priceFrameView.centerYAnchor),
            priceLabel.centerXAnchor.constraint(equalTo: priceFrameView.centerXAnchor)
        ])
    }

}

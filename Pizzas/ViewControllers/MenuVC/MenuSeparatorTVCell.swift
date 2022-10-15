//
//  MenuSeparatorCell.swift
//  Pizzas
//
//  Created by juliemoorled on 14.10.2022.
//

import UIKit

final class MenuSeparatorCell: UITableViewCell {

    static let cellIdentifier = "MenuSeparatorCell"

    let separatorView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemGray6
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpSeparator() {
        selectionStyle = .none
        backgroundColor = .systemGray6
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.topAnchor.constraint(equalTo: topAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        separatorView.backgroundColor = .systemBackground
        separatorView.layer.cornerRadius = 20
        separatorView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

}

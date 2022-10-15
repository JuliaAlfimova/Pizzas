//
//  MenuCityPicker.swift
//  Pizzas
//
//  Created by juliemoorled on 13.10.2022.
//

import UIKit

extension MenuVC {

    func setUpCityPicker() {
        let buttonText = NSMutableAttributedString()
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = cityPickerImage?.withTintColor(.label)
        let textAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular),
                             NSAttributedString.Key.foregroundColor: UIColor.label]
        let textAttachment = NSMutableAttributedString(string: "Москва",
                                                       attributes: textAttribute as [NSAttributedString.Key: Any])
        buttonText.append(textAttachment)
        buttonText.append(NSAttributedString(string: " "))
        buttonText.append(NSAttributedString(attachment: imageAttachment))
        cityButton.setAttributedTitle(buttonText, for: .normal)
        cityButton.contentHorizontalAlignment = .left
        view.addSubview(cityButton)
        cityButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cityButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            cityButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }

}


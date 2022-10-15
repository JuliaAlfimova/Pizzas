//
//  ViewController.swift
//  Pizzas
//
//  Created by juliemoorled on 13.10.2022.
//

import UIKit

class TabBarVC: UITabBarController {

    enum TabBarItem: String, CaseIterable {

        case menu = "Меню"
        case contacts = "Контакты"
        case profile = "Профиль"
        case trash = "Корзина"

        var viewController: UIViewController {
            switch self {
                case .menu:
                    return MenuVC()
                case .contacts:
                    return ContactsVC()
                case .profile:
                    return ProfileVC()
                case .trash:
                    return TrashVC()
            }
        }

        var itemImages: UIImage? {
            switch self {
                case .menu:
                    return UIImage(systemName: "fork.knife.circle")
                case .contacts:
                    return UIImage(systemName: "mappin.circle")
                case .profile:
                    return UIImage(systemName: "person.circle")
                case .trash:
                    return UIImage(systemName: "trash.circle")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }

    private func setUpTabBar() {
        viewControllers = [generateTabBarItem(tabBarItem: .menu),
                            generateTabBarItem(tabBarItem: .contacts),
                            generateTabBarItem(tabBarItem: .profile),
                            generateTabBarItem(tabBarItem: .trash)]
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .label
    }

    private func generateTabBarItem(tabBarItem: TabBarItem) -> UIViewController {
        let viewController = tabBarItem.viewController
        viewController.tabBarItem.title = tabBarItem.rawValue
        viewController.tabBarItem.image = tabBarItem.itemImages
        return viewController
    }


}


//
//  MenuTableVew.swift
//  Pizzas
//
//  Created by juliemoorled on 14.10.2022.
//

import UIKit

extension MenuVC: UITableViewDelegate, UITableViewDataSource {

    func setUpTableView() {
        setTVDelegateAndDataSource()
        registerTVCells()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: cityButton.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func setTVDelegateAndDataSource() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func registerTVCells() {
        tableView.register(MenuBannersTVCell.self, forCellReuseIdentifier: MenuBannersTVCell.cellIdentifier)
        tableView.register(MenuCategoriesTVCell.self, forCellReuseIdentifier: MenuCategoriesTVCell.cellIdentifier)
        tableView.register(MenuSeparatorCell.self, forCellReuseIdentifier: MenuSeparatorCell.cellIdentifier)
        tableView.register(MenuProductTVCell.self, forCellReuseIdentifier: MenuProductTVCell.cellIdentifier)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.scrollsToTop {
            (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? MenuCategoriesTVCell ?? .init())?.selectedCategoryNumber = 0
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return view.frame.height * 0.15
        } else if indexPath.row == 1 {
            return 70
        } else if indexPath.row == 2 {
            return 20
        } else {
            return view.frame.height * 0.2
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 + products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: MenuBannersTVCell.cellIdentifier, for: indexPath) as? MenuBannersTVCell ?? .init()
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuCategoriesTVCell.cellIdentifier, for: indexPath) as?  MenuCategoriesTVCell ?? .init()
            cell.categories = categories
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuSeparatorCell.cellIdentifier, for: indexPath) as?  MenuSeparatorCell ?? .init()
            if categories.isEmpty == false {
                cell.setUpSeparator()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuProductTVCell.cellIdentifier, for: indexPath) as? MenuProductTVCell ?? .init()
            cell.product = products[indexPath.row-3]
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }

}

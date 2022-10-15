//
//  MenuVC.swift
//  Pizzas
//
//  Created by juliemoorled on 13.10.2022.
//

import UIKit

final class MenuVC: UIViewController {

    let cityButton = UIButton()
    let cityPickerImage = UIImage(systemName: "chevron.down")
    let tableView = UITableView()
    var categories: [Category] = []
    var products: [Product] = []

    override func loadView() {
         super.loadView()
        getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setUpCityPicker()
        setUpTableView()
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}


//
//  FruitsListViewController.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import UIKit
import SnapKit
import PKHUD

extension FruitsListViewController {
    struct Appearance {
        static let backgroundColor: UIColor = .white
        static let titleFont: UIFont = .systemFont(ofSize: 32.0, weight: .light)
        static let titleColor: UIColor = .black
        static let subtitleFont: UIFont = .systemFont(ofSize: 18.0, weight: .regular)
        static let subtitleColor: UIColor = .darkGray
    }
}

// MARK: - FruitsListViewController implementation
class FruitsListViewController: UIViewController {

    var presenter: FruitsListPresenterProtocol!
    var fruits = [FruitViewModel]()

    // MARK: - UI items
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fruits"
        view.backgroundColor = Appearance.backgroundColor
        addSubviews()
        makeConstraints()
        presenter.viewDidLoad()
    }

    // MARK: - Private methods
    private func addSubviews() {
        view.addSubview(tableView)
    }

    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - FruitsListViewProtocol implementation
extension FruitsListViewController: FruitsListViewProtocol {

    func updateTableView(fruits: [FruitViewModel]) {
        self.fruits = fruits
        tableView.reloadData()
    }

    func showLoader() {
        // TODO: move strings to the text manager
        HUD.show(.labeledProgress(title: nil, subtitle: "Obtaining fruits"))
    }

    func hideLoader() {
        HUD.hide()
    }

    func showErrorAlert(with text: String) {
        // TODO: move strings to the text manager
        let errorAlert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        errorAlert.addAction(cancelAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate implementation
extension FruitsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fruitViewModel = fruits[indexPath.row]
        presenter.didSelectFruit(fruit: fruitViewModel)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource implementation
extension FruitsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = fruits[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

        cell.textLabel?.text = viewModel.caption()
        cell.textLabel?.font = Appearance.titleFont
        cell.textLabel?.textColor = Appearance.titleColor

        cell.detailTextLabel?.text = viewModel.subtitle()
        cell.detailTextLabel?.font = Appearance.subtitleFont
        cell.detailTextLabel?.textColor = Appearance.subtitleColor
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
}

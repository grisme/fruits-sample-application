//
//  FruitsListViewProtocol.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation

protocol FruitsListViewProtocol: class {

    var presenter: FruitsListPresenterProtocol! { get set }

    func showLoader()
    func hideLoader()
    func showErrorAlert(with text: String)
    func updateTableView(fruits:[FruitViewModel])

}

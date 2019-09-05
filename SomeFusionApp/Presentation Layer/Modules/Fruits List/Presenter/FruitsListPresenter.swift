//
//  FruitsListPresenter.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - FruitsListPresenter implementation
class FruitsListPresenter {

    weak var view: FruitsListViewProtocol!
    var interactor: FruitsListInteractorProtocol!
    var router: FruitsListRouterProtocol!
    let disposeBag = DisposeBag()

}

// MARK: - FruitsListPresenterProtocol implementation
extension FruitsListPresenter: FruitsListPresenterProtocol {

    func viewDidLoad() {
        view.showLoader()
        interactor.obtainFruits().subscribe(onNext: { [weak self] fruits in
            self?.view.hideLoader()

            // Mapping obtained fruit models into fruit view models
            var fruitViewModels = [FruitViewModel]()
            fruits.forEach({ fruit in
                let viewModel = FruitViewModel(fruit: fruit)
                fruitViewModels.append(viewModel)
            })

            // Updating view
            self?.view.updateTableView(fruits: fruitViewModels)

        }, onError: { [weak self] error in
            self?.view.hideLoader()
            self?.view.showErrorAlert(with: error.localizedDescription)
        }).disposed(by: disposeBag)
    }

    func didSelectFruit(fruit: FruitViewModel) {
        router.openFruitDetails(fruitIdentifier: fruit.identifier())
    }

}

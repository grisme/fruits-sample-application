//
//  FruitDetailsPresenter.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 06.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - FruitDetailsPresenter implementation
class FruitDetailsPresenter {
    weak var view: FruitDetailsViewProtocol!
    var interactor: FruitDetailsInteractorProtocol!
    var fruitIdentifier: Int
    let disposeBag = DisposeBag()

    init(fruitIdentifier: Int) {
        self.fruitIdentifier = fruitIdentifier
    }
}

// MARK: - FruitDetailsPresenterProtocol implementation
extension FruitDetailsPresenter: FruitDetailsPresenterProtocol {

    func viewDidLoad() {
        // Touch my ta-la-la...
        view?.showLoader()
        interactor.obtainFruitWithIdentifier(identifier: fruitIdentifier).subscribe(onNext: { [weak self] fruit in
            self?.view.hideLoader()
            let viewModel = FruitDetailsViewModel(fruit: fruit)
            self?.view.updateFruitViewModel(viewModel: viewModel)
        }).disposed(by: disposeBag)
    }
}


//var view: FruitDetailsViewProtocol

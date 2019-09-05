//
//  FruitDetailsViewProtocol.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 06.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation

protocol FruitDetailsViewProtocol: class {

    func showLoader()
    func hideLoader()
    func updateFruitViewModel(viewModel: FruitDetailsViewModel)

}

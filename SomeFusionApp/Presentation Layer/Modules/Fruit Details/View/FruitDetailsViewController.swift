//
//  FruitDetailsViewController.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 06.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import UIKit
import SnapKit
import PKHUD

extension FruitDetailsViewController {

    struct Appearance {
        static let backgroundColor: UIColor = .white
        static let symbolFont: UIFont = .systemFont(ofSize: 72.0)
        static let titleFont: UIFont = .systemFont(ofSize: 48.0, weight: .bold)
        static let titleColor: UIColor = .black
        static let subtitleFont: UIFont = .systemFont(ofSize: 24.0, weight: .regular)
        static let subtitleColor: UIColor = .gray
        static let sideOffet: CGFloat = 20.0
        static let topOffset: CGFloat = 20.0
        static let topBigOffset: CGFloat = 30.0
    }
}

// MARK: - FruitDetailsViewController implementation
class FruitDetailsViewController: UIViewController {

    // MARK: - Properties
    var presenter: FruitDetailsPresenterProtocol!

    // MARK: - UI items
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Appearance.titleFont
        label.textColor = Appearance.titleColor
        label.textAlignment = .center
        return label
    }()

    private lazy var symbolLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Appearance.symbolFont
        label.textAlignment = .center
        return label
    }()

    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.isSelectable = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = Appearance.subtitleFont
        textView.textColor = Appearance.subtitleColor
        return textView
    }()


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        view.backgroundColor = Appearance.backgroundColor
        addSubviews()
        makeConstraints()
        presenter.viewDidLoad()
    }

    // MARK: - Private methods
    private func addSubviews() {
        view.addSubview(symbolLabel)
        view.addSubview(titleLabel)
        view.addSubview(descriptionTextView)
    }

    private func makeConstraints() {
        symbolLabel.snp.makeConstraints { make in
            make.width.height.equalTo(self.view.snp.width).dividedBy(3)
            make.topMargin.equalToSuperview().offset(Appearance.topOffset)
            make.centerX.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Appearance.sideOffet)
            make.top.equalTo(symbolLabel.snp.bottom).offset(Appearance.topOffset)
        }

        descriptionTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Appearance.sideOffet)
            make.topMargin.equalTo(titleLabel.snp.bottom).offset(Appearance.topBigOffset)
            make.bottomMargin.equalToSuperview()
        }
    }
}

// MARK: - FruitDetailsViewProtocol implementation
extension FruitDetailsViewController: FruitDetailsViewProtocol {
    func showLoader() {
        // TODO: move strings to the text manager
        HUD.show(.labeledProgress(title: nil, subtitle: "Obtaining detail data"))
    }

    func hideLoader() {
        HUD.hide()
    }

    func updateFruitViewModel(viewModel: FruitDetailsViewModel) {
        symbolLabel.text = viewModel.symbol()
        titleLabel.text = viewModel.title()
        descriptionTextView.text = viewModel.subtitle()
    }
}

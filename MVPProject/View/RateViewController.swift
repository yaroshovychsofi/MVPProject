//
//  RateViewController.swift
//  MVPProject
//
//  Created by Софія Ярошович on 12.02.2026.
//

import UIKit
import SnapKit

class RateViewController: UIViewController, RateView {
    private lazy var presenter = RatePresenter(rateView: self)
    private var loader = UIActivityIndicatorView(style: .medium)

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Rate"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    private let getRateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Current Rate", for: .normal)
        return button
    }()

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(getRateButton)
        view.addSubview(loader)

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
        getRateButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        loader.snp.makeConstraints { make in
            make.leading.equalTo(getRateButton.snp.trailing).offset(10)
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.centerY.equalTo(getRateButton.snp.centerY)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        getRateButton.addTarget(self, action: #selector(getRate), for: .touchUpInside)
    }

    @objc private func getRate() {
        presenter.didTapGetRate()
    }

    func setLoading(_ isLoading: Bool) {
        getRateButton.isEnabled = !isLoading
        if isLoading {
            loader.startAnimating()
        } else {
            loader.stopAnimating()
        }
    }

    func showRate(_ rate: ExchangeRate) {
        let formattedRate = String(format: "%.2f", rate.rate)
        titleLabel.text = "\(rate.fromCurrency) → \(rate.toCurrency) = \(formattedRate)"
    }

    func showError(_ error: any Error) {
        titleLabel.text = "Error: \(error)"
    }
}

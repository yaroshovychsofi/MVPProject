//
//  RatePresenter.swift
//  MVPProject
//
//  Created by Софія Ярошович on 12.02.2026.
//

import Foundation

class RatePresenter: AnyObject {
    private let service: NetworkServiceProtocol
    private weak var rateView: RateView?

    init(service: NetworkServiceProtocol = NetworkService(), rateView: RateView) {
        self.service = service
        self.rateView = rateView
    }

    func didTapGetRate() {
        rateView?.setLoading(true)
        service.fetchRate { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                self.rateView?.setLoading(false)
                switch result {
                case let .success(rate):
                    self.rateView?.showRate(rate)
                case let .failure(error):
                    self.rateView?.showError(error)
                }
            }
        }
    }
}

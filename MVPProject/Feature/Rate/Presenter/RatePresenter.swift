//
//  RatePresenter.swift
//  MVPProject
//
//  Created by Софія Ярошович on 12.02.2026.
//  Copyright © 2026 MVPProject. All rights reserved.
//

import Foundation

class RatePresenter: AnyObject {
    private let service: NetworkServiceProtocol
    private weak var rateView: RateViewProtocol?
    
    private var isLoading: Bool = false
    
    init(rateView: RateViewProtocol, service: NetworkServiceProtocol) {
        self.service = service
        self.rateView = rateView
    }
    
    func didTapGetRate() {
        guard !isLoading else { return }
        isLoading.toggle()
        rateView?.setLoading(true)
        service.fetchRate { [weak self] result in
            guard let self else { return }
            self.rateView?.setLoading(false)
            isLoading.toggle()
            switch result {
            case let .success(rate):
                self.rateView?.showRate(rate)
            case let .failure(error):
                self.rateView?.showError(error)
            }
        }
    }
}

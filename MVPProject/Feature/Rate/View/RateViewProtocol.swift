//
//  RateView.swift
//  MVPProject
//
//  Created by Софія Ярошович on 12.02.2026.
//  Copyright © 2026 MVPProject. All rights reserved.
//

protocol RateViewProtocol: AnyObject {
    func setLoading(_ isLoading: Bool)
    func showRate(_ rate: ExchangeRate)
    func showError(_ error: Error)
}

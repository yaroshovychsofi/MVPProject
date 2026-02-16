//
//  RateModule.swift
//  MVPProject
//
//  Created by Софія Ярошович on 16.02.2026.
//  Copyright © 2026 MVPProject. All rights reserved.
//

import UIKit

enum RateModule {

    static func build() -> UIViewController {
        let vc = RateViewController()
        let presenter = RatePresenter(rateView: vc, service: NetworkService())
        vc.presenter = presenter
        return vc
    }
}

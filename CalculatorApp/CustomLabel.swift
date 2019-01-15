//
//  CustomLabel.swift
//  CalculatorApp
//
//  Created by Tushar  Jadhav on 2019-01-14.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import UIKit

extension UILabel {
    
    func blink() {
        self.alpha = 0.0;
        UIView.animate(withDuration: 0.1, //Time duration you want,
            delay: 0.0,
            options: [.curveEaseInOut],
            animations: { [weak self] in self?.alpha = 1.0 },
            completion: { [weak self] _ in self?.alpha = 1.0 })
    }

}

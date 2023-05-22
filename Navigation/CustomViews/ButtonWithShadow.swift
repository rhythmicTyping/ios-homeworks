//
//  CustomButton.swift
//  Navigation
//
//  Created by Evgeny Savin on 23.04.2023.
//

import UIKit

class ButtonWithShadow: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeShadowed()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeShadowed()
    }
    
    func makeShadowed() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
        self.layer.masksToBounds = false
    }
}


//
//  ButtonWithChangingAlpha.swift
//  Navigation
//
//  Created by Evgeny Savin on 22.05.2023.
//

import UIKit

class ButtonWithChangingAlpha: UIButton {
    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.8 : 1.0
        }
    }
    
    override var isSelected: Bool {
        didSet {
            alpha = isSelected ? 0.8 : 1.0
        }
    }
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.8
        }
    }
    
}

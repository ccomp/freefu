//
//  colorView.swift
//  freefu
//
//  Created by Cyron Completo on 2/11/18.
//  Copyright © 2018 GROUP FAIVE. All rights reserved.
//

import UIKit

class colorView: UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.7, y:1.0)
        gradientLayer.endPoint = CGPoint(x: 0.4, y:0.0)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

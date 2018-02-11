//
//  ViewController.swift
//  freefu
//
//  Created by Cyron Completo on 2/10/18.
//  Copyright © 2018 GROUP FAIVE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setGradientBackground(colorOne: UIColor(red:0.11, green:0.19, blue:0.59, alpha:1.0), colorTwo: UIColor(red:0.76, green:0.25, blue:0.84, alpha:1.0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.7, y:1.0)
        gradientLayer.endPoint = CGPoint(x: 0.4, y:0.0)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }


}


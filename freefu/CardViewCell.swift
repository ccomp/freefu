//
//  CardViewCell.swift
//  freefu
//
//  Created by Cyron Completo on 2/11/18.
//  Copyright © 2018 GROUP FAIVE. All rights reserved.
//

import UIKit

class CardViewCell: UITableViewCell {

    @IBOutlet weak var CellImageView: UIImageView!
    
    @IBOutlet weak var CellLabel: UILabel!
    
    @IBOutlet weak var CellDescription: UITextView!
    
    
    @IBOutlet weak var CellView: UIView!
    
    @IBOutlet weak var CellLocation: UILabel!
    
    @IBOutlet weak var CellTime: UILabel!
    
    @IBInspectable var cornerRadius: CGFloat = 2
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var shadowColor: UIColor? = UIColor.white
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        CellView.backgroundColor = UIColor.clear
        
        self.CellView.bringSubview(toFront: self.CellLabel)
        self.CellView.bringSubview(toFront: self.CellLocation)
        self.CellView.bringSubview(toFront: self.CellTime)
        self.CellView.bringSubview(toFront: self.CellDescription)
//        CellImageView.backgroundColor = UIColor.darkGray
        let newFrame : CGRect = self.frame
        let newView : UIView = UIView(frame: newFrame)
//        newView.isUserInteractionEnabled = false
        newView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
//        newView.alpha = 0.5
        self.CellView.insertSubview(newView, belowSubview: self.CellLabel)
//        self.sendSubview(toBack: newView)
//        self.sendSubview(toBack: CellImageView)
        
//        self.bringSubview(toFront: CellLabel)
//        self.bringSubview(toFront: CellLocation)
        
//        layer.cornerRadius = cornerRadius
//        layer.backgroundColor = shadowColor?.cgColor
//        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//
//        layer.masksToBounds = false
//        layer.shadowColor = shadowColor?.cgColor
//        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowPath = shadowPath.cgPath
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

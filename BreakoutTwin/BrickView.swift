//
//  BrickView.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 02/05/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

class BrickView: UIView {
    
    var color: UIColor?
    var points: Int?
    var name: String?
    
    convenience init(x_pos: CGFloat, width: CGFloat, y_pos: CGFloat, height: CGFloat, name: String) {
        var frame = CGRect(x: x_pos, y: y_pos, width: width, height: height)
        self.init(frame: frame)
        self.name = name
        self.backgroundColor = UIColor.random
        self.layer.cornerRadius = 3.0
        self.layer.borderColor = UIColor.grayColor().CGColor;
        self.layer.borderWidth = 0.5;
        
        self.layer.shadowColor = UIColor.blackColor().CGColor;
        self.layer.shadowOffset = CGSize(width: 0, height: 3);
        self.layer.shadowRadius = 3.0;
        self.layer.shadowOpacity = 0.5;
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

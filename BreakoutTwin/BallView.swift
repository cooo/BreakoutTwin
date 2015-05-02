//
//  BallView.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 24/04/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

class BallView: UIView {
    
    struct Ball {
        static let radius = CGFloat(20)
    }
    
    convenience init(gameView: UIView, y_pos: CGFloat) {
        var frame = CGRect(x: gameView.bounds.midX, y: y_pos, width: Ball.radius, height: Ball.radius)
        self.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = Ball.radius / 2
        self.layer.borderColor = UIColor.grayColor().CGColor;
        self.layer.borderWidth = 2;
        
        self.layer.shadowColor = UIColor.blackColor().CGColor;
        self.layer.shadowOffset = CGSize(width: 1, height: 2);
        self.layer.shadowRadius = 1.0;
        self.layer.shadowOpacity = 0.5;
        gameView.addSubview(self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

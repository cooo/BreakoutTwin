//
//  PaddleView.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 23/04/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

class PaddleView: UIView {
    
    struct Paddle {
        static let height = CGFloat(20)
        static let width = CGFloat(50)
    }
    
    var name: String?

    convenience init(gameView: UIView, y_pos: CGFloat, name: String) {
        var frame = CGRect(x: gameView.bounds.midX, y: y_pos, width: Paddle.width, height: Paddle.height)
        self.init(frame: frame)
        self.name = name
        self.backgroundColor = UIColor.blueColor()
        self.layer.cornerRadius = 3.0
        self.layer.borderColor = UIColor.grayColor().CGColor;
        self.layer.borderWidth = 1.5;
        
        self.layer.shadowColor = UIColor.blackColor().CGColor;
        self.layer.shadowOffset = CGSize(width: 0, height: 3);
        self.layer.shadowRadius = 3.0;
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

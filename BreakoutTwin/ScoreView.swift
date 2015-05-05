//
//  ScoreView.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 05/05/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

class ScoreView: UIView {
    
    var score: Int? {
        didSet {
            setNeedsDisplay()
        }
    }
    var label: UILabel?
    
    convenience init(gameView: UIView) {
        var frame = CGRect(x: gameView.bounds.midX, y: gameView.bounds.height / 7, width: gameView.bounds.midX - 50, height: 50)
        self.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        label = UILabel(frame: CGRect(x:0, y:0, width: gameView.bounds.midX - 50, height: 50))
        label!.font = UIFont.boldSystemFontOfSize(CGFloat(50))
        label!.textAlignment = NSTextAlignment.Right
        self.addSubview(label!)
        score = 0
    }

    override func drawRect(rect: CGRect) {
        if score != nil {
            label!.text = "\(score!)"
            // do some nifty 70's styled digits here
       }
    }
}

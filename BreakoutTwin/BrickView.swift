//
//  BrickView.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 02/05/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

class BrickView: UIView {
    
    private struct Brick {
        var points: Int
        var color: UIColor
    }
    
    private class Bricks {
        class var random: Brick {
            switch arc4random()%5 {
            case 0: return Brick(points: 10, color: UIColor.yellowColor())
            case 1: return Brick(points: 25, color: UIColor.orangeColor())
            case 2: return Brick(points: 40, color: UIColor.redColor())
            case 3: return Brick(points: 60, color: UIColor.purpleColor())
            case 4: return Brick(points: 75, color: UIColor.greenColor())
            default: return Brick(points: 0, color: UIColor.blackColor())
            }
        }
    }
    
    var color: UIColor?
    var points = 0
    var name: String?
    
    convenience init(x_pos: CGFloat, width: CGFloat, y_pos: CGFloat, height: CGFloat, name: String) {
        var frame = CGRect(x: x_pos, y: y_pos, width: width, height: height)
        self.init(frame: frame)
        self.name = name
        let brick = Bricks.random
        self.backgroundColor = brick.color
        self.points = brick.points
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


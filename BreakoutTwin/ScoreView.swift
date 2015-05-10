//
//  ScoreView.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 05/05/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

class ScoreView: UIView {
    
    struct LcdDigit {
        static let height = CGFloat(50)
        static let width = CGFloat(25)
        static let digit_gap = CGFloat(5)
        static let gap = CGFloat(3)
    }
    
    var digits : [String:String] = [
        //    0    -
        //   1 2  | |
        //    3    -
        //   4 5  | |
        //    6    -
        //   0123456
        "0":"1110111",
        "1":"0010010",
        "2":"1011101",
        "3":"1011011",
        "4":"0111010",
        "5":"1101011",
        "6":"0101111",
        "7":"1010010",
        "8":"1111111",
        "9":"1111010",
    ]
    
    private var lcdElements = [String:UIBezierPath]()
    
    func setLcdElement(named name: String, path: UIBezierPath?) {
        lcdElements[name] = path
    }
    
    var score:Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var label: UILabel?
    
    convenience init(gameView: UIView) {
        var frame = CGRect(x: gameView.bounds.midX, y: gameView.bounds.height / 7, width: gameView.bounds.midX - 25 , height: 50)
        self.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        var strScore = "\(score)"
        var pos = countElements(strScore)
        for digit in strScore {
            drawScore(lcd_digit: digits["\(digit)"]!, at_position: pos)
            pos -= 1
        }
    }
    
    func drawScore(lcd_digit lcd: String, at_position pos: Int) {
        var x = self.bounds.width - (CGFloat(pos) * (LcdDigit.width + LcdDigit.digit_gap))
        var element = 0
        for part in lcd {
            var name = "d\(pos),\(element)"
            if lcdElements[name] == nil {
                setLcdElement(named: name, path: draw(element, x_pos: x))
            }
            var path = lcdElements[name]
            if part == "1" {
                UIColor.redColor().setStroke()
            }
            else {
                UIColor.clearColor().setStroke()
            }
            path!.stroke()
            element += 1
        }
    }
    
    func draw(element: Int, x_pos: CGFloat) -> UIBezierPath {
        var path = UIBezierPath()
        switch element {
        case 0:
            path.moveToPoint(CGPoint(x: x_pos + LcdDigit.gap, y:0))
            path.addLineToPoint(CGPoint(x:x_pos + LcdDigit.width - LcdDigit.gap, y:0))
        case 1:
            path.moveToPoint(CGPoint(x: x_pos, y:LcdDigit.gap))
            path.addLineToPoint(CGPoint(x: x_pos, y: LcdDigit.height/2 - LcdDigit.gap))
        case 2:
            path.moveToPoint(CGPoint(x:x_pos + LcdDigit.width, y:LcdDigit.gap))
            path.addLineToPoint(CGPoint(x: x_pos + LcdDigit.width, y: LcdDigit.height/2 - LcdDigit.gap))
        case 3:
            path.moveToPoint(CGPoint(x: x_pos + LcdDigit.gap, y: LcdDigit.height/2))
            path.addLineToPoint(CGPoint(x:x_pos + LcdDigit.width - LcdDigit.gap, y:LcdDigit.height/2))
        case 4:
            path.moveToPoint(CGPoint(x: x_pos, y:LcdDigit.height/2 + LcdDigit.gap))
            path.addLineToPoint(CGPoint(x:x_pos, y:LcdDigit.height - LcdDigit.gap))
        case 5:
            path.moveToPoint(CGPoint(x:x_pos + LcdDigit.width, y:LcdDigit.height/2 + LcdDigit.gap))
            path.addLineToPoint(CGPoint(x: x_pos + LcdDigit.width, y: LcdDigit.height - LcdDigit.gap))
        case 6:
            path.moveToPoint(CGPoint(x: x_pos + LcdDigit.gap, y:LcdDigit.height))
            path.addLineToPoint(CGPoint(x:x_pos + LcdDigit.width - LcdDigit.gap, y:LcdDigit.height))
        default:
            return path
        }
            
        UIColor.redColor().setStroke()
        path.lineWidth = 4
        return path
    }
}


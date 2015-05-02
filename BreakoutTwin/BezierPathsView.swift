//
//  BezierPathsView.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 23/04/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

class BezierPathsView: UIView {
    
    var behavior: GameBehavior?

    private var bezierPaths = [String:UIBezierPath]()
    
    let wallSize = CGFloat(10)
    
    func setPath(path: UIBezierPath?, named name: String) {
        bezierPaths[name] = path
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        for (_, path) in bezierPaths {
            path.stroke()
        }
    }
        
    func addBarrier(from: CGPoint, to: CGPoint, name: String) {
        let path = UIBezierPath()
        path.moveToPoint(from)
        path.addLineToPoint(to)
        path.lineWidth = wallSize
        
        behavior!.addBarrier(path, named: name)
        setPath(path, named: name)
    }
}

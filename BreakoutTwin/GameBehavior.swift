//
//  GameBehavior.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 24/04/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

class GameBehavior: UIDynamicBehavior {
        
    lazy var ballMovement: UIDynamicItemBehavior = {
        let lazilyCreatedBallMovement = UIDynamicItemBehavior()
        lazilyCreatedBallMovement.allowsRotation = false
        lazilyCreatedBallMovement.elasticity = 1.0
        lazilyCreatedBallMovement.friction = 0.0
        lazilyCreatedBallMovement.resistance = 0.0
        lazilyCreatedBallMovement.action = {
            for item in lazilyCreatedBallMovement.items {
                if let ball = item as? UIView {
                    if ball.frame.origin.y < 0 || ball.frame.origin.y > self.dynamicAnimator?.referenceView?.bounds.height {
                        self.removeBall(ball)
                    }
                }
            }
        }
        return lazilyCreatedBallMovement
    }()
    
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = false
        
        return lazilyCreatedCollider
    }()
    
    override init() {
        super.init()
        addChildBehavior(ballMovement)
        addChildBehavior(collider)
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addBall(ball: UIView) {
        dynamicAnimator?.referenceView?.addSubview(ball)
        
        let push = UIPushBehavior(items: [ball], mode: .Instantaneous)
//        push.magnitude = 0.1
//        var randomAngle = -27.0 //Double(arc4random())
//        print(randomAngle)
//        push.angle = CGFloat(randomAngle) // *  M_PI)// / Double(UINT32_MAX))

        push.pushDirection = CGVector(dx: 0.1, dy: -0.1)
        push.action = { [weak push] in
            if !push!.active {
                self.removeChildBehavior(push!)
            }
        }
        addChildBehavior(push)
        
        ballMovement.addItem(ball)
        collider.addItem(ball)
    }
    
    func removeBall(ball: UIView) {
        ball.removeFromSuperview() // causes a viewDidLayoutSubviews
        collider.removeItem(ball)
        ballMovement.removeItem(ball)
    }

    func addPaddle(paddle: UIView, name: String) {
        let path = UIBezierPath(roundedRect: paddle.frame, cornerRadius: CGFloat(50))
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
}

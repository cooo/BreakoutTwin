//
//  BreakoutTwinViewController.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 23/04/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

class BreakoutTwinViewController: UIViewController, UIDynamicAnimatorDelegate {
 
    @IBOutlet weak var gameView: BezierPathsView!
    let gameBehavior = GameBehavior()
    
    lazy var animator: UIDynamicAnimator = {
        let lazilyCreatedDynamicAnimator = UIDynamicAnimator(referenceView: self.gameView)
        lazilyCreatedDynamicAnimator.delegate = self
        return lazilyCreatedDynamicAnimator
        }()
    
    let wallSize = CGFloat(10)
    let cornerSize = CGFloat(30)
    let paddleFloatSize = CGFloat(40)

    let accelerator = CGFloat(1.5)
    
    var paddleViews = [PaddleView?]()
    
    struct PathNames {
        static let TopLeftBarrier = "Top Left Barrier"
        static let TopRightBarrier = "Top Right Barrier"
        static let LeftBarrier = "Left Barrier"
        static let BottomLeftBarrier = "Bottom Left Barrier"
        static let BottomRightBarrier = "Bottom Right Barrier"
        static let RightBarrier = "Right Barrier"
        static let topPaddle = "Top Paddle"
        static let bottomPaddle = "Bottom Paddle"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initAppearance()
        animator.addBehavior(gameBehavior)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func initAppearance() -> Void {
        gameView.backgroundColor = UIColor.clearColor()
        let background = CAGradientLayer().blueColor()
        background.frame = self.view.frame
        self.view.layer.insertSublayer(background, atIndex: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if paddleViews.count < 2 {

            var bottomPaddle = PaddleView(gameView: gameView, y_pos: gameView.bounds.height - paddleFloatSize, name: PathNames.bottomPaddle)
            paddleViews.append(bottomPaddle)
            gameBehavior.addPaddle(bottomPaddle, name: PathNames.bottomPaddle)

            var topPaddle = PaddleView(gameView: gameView, y_pos: paddleFloatSize - PaddleView.Paddle.height, name: PathNames.topPaddle)
            paddleViews.append(topPaddle)
            gameBehavior.addPaddle(topPaddle, name: PathNames.topPaddle)

            gameView.behavior = gameBehavior
            
            gameView.addBarrier(CGPoint(x: cornerSize, y: wallSize/2),                          to: CGPoint(x: 0,          y: wallSize/2),                          name: PathNames.TopLeftBarrier)
            gameView.addBarrier(CGPoint(x: wallSize/2, y: 0),                                   to: CGPoint(x: wallSize/2, y: gameView.bounds.height),              name: PathNames.LeftBarrier)
            gameView.addBarrier(CGPoint(x: 0,          y: gameView.bounds.height - wallSize/2), to: CGPoint(x: cornerSize, y: gameView.bounds.height - wallSize/2), name: PathNames.BottomLeftBarrier)
            
            gameView.addBarrier(CGPoint(x: gameView.bounds.width - cornerSize, y: wallSize/2), to: CGPoint(x: gameView.bounds.width, y: wallSize/2), name: PathNames.TopRightBarrier)
            gameView.addBarrier(CGPoint(x: gameView.bounds.width - wallSize/2, y: 0), to: CGPoint(x: gameView.bounds.width - wallSize/2, y: gameView.bounds.height), name: PathNames.RightBarrier)
            gameView.addBarrier(CGPoint(x: gameView.bounds.width - cornerSize, y: gameView.bounds.height - wallSize/2), to: CGPoint(x: gameView.bounds.width, y: gameView.bounds.height - wallSize/2), name: PathNames.BottomRightBarrier)
        }

    }
    
    func addBall() {
        var ball = BallView(gameView: gameView, y_pos: gameView.bounds.height - gameView.bounds.height / 4)
        gameBehavior.addBall(ball)
    }
    
    @IBAction func movePaddle(gesture: UIPanGestureRecognizer) {
        var translation = gesture.translationInView(gameView)

        for paddleView in paddleViews {
            if let paddle = paddleView {
                if paddle.frame.origin.x >= wallSize && paddle.frame.origin.x <= gameView.bounds.width - wallSize - PaddleView.Paddle.width {
                    paddle.frame.origin.x += translation.x * accelerator
                } else {
                    if paddle.frame.origin.x >= wallSize {
                        paddle.frame.origin.x = gameView.bounds.width - wallSize - PaddleView.Paddle.width
                    } else {
                        paddle.frame.origin.x = wallSize
                    }
                }
                gameBehavior.addPaddle(paddle, name: paddle.name!)
            }
            
        }
        gesture.setTranslation(CGPointZero, inView: gameView)
    }

    @IBAction func createBall(sender: UITapGestureRecognizer) {
        if sender.state == .Ended {
            if gameBehavior.ballMovement.items.count == 0 {
                addBall()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

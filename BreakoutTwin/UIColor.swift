//
//  UIColor.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 03/05/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

extension UIColor {
    class var random: UIColor {
        switch arc4random()%5 {
        case 0: return UIColor.greenColor()
        case 1: return UIColor.blueColor()
        case 2: return UIColor.orangeColor()
        case 3: return UIColor.redColor()
        case 4: return UIColor.purpleColor()
        default: return UIColor.blackColor()
        }
    }
}

//
//  gradientBackground.swift
//  BreakoutTwin
//
//  Created by Collin Oosterbaan on 23/04/15.
//  Copyright (c) 2015 Collin Oosterbaan. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func blueColor() -> CAGradientLayer {
        let topColor = UIColor(red: (96/255.0), green: (160/255.0), blue: (250/255.0), alpha: 1)
        let bottomColor = UIColor(red: (208/255.0), green: (225/255.0), blue: (245/255.0), alpha: 1)
        
        let gradientColors: Array <AnyObject> = [bottomColor.CGColor, topColor.CGColor, topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: Array <AnyObject> = [0.0, 0.4, 0.6, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
}

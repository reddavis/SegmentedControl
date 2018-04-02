//
//  UIColor+Extensions.swift
//  SegmentedControl
//
//  Created by Red Davis on 27/03/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import UIKit


internal extension UIColor
{
    internal func with(alpha: CGFloat) -> UIColor
    {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        self.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

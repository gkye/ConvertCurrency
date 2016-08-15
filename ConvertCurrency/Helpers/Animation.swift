//
//  Animation.swift
//  ConvertCurrency
//
//  Created by George Kye on 2016-08-14.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
  func pop(){
    CATransaction.begin()
    let animation = CAKeyframeAnimation(keyPath: "transform.scale")
    animation.values = [0, 0.2 * 1, -0.2 * 1, 0.2 * 1, 0]
    animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    animation.duration = CFTimeInterval(0.3)
    animation.isAdditive = true
    animation.repeatCount = 1
    animation.beginTime = CACurrentMediaTime() + CFTimeInterval(0.1)
    self.layer.add(animation, forKey: "pop")
    CATransaction.commit()

  }
  
}


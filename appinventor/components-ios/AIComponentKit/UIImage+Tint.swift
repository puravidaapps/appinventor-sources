// -*- mode: swift; swift-mode:basic-offset: 2; -*-
// Copyright © 2019 Massachusetts Institute of Technology, All rights reserved.

import Foundation

extension UIImage {
  /**
   * Creates a new UIImage from the receiver with the given tint color applied.
   * The tint is applied using the DuffPorter SourceATop combinator.
   *
   * @param tint The tint color to apply
   * @returns A copy of the current UIImage with the tint applied
   */
  func imageWithTint(tint: UIColor) -> UIImage? {
    let bounds = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
    UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
    self.draw(in: bounds)
    tint.setFill()
    UIRectFillUsingBlendMode(bounds, .sourceAtop)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
  }
}

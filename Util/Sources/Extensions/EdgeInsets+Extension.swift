//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0

import SwiftUI

extension EdgeInsets {
  var horizontalInsets: CGFloat { trailing + leading }
  var verticalInsets: CGFloat { top + bottom }
  var left: CGFloat { leading }
  var right: CGFloat { trailing }
    
  static func with(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> EdgeInsets {
    EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
  }
    
  static func horizontal(_ horizontal: CGFloat, top: CGFloat = 0, bottom: CGFloat = 0) -> UIEdgeInsets {
    UIEdgeInsets(
      top: top,
      left: horizontal,
      bottom: bottom,
      right: horizontal
    )
  }
    
  static func vertical(_ vertical: CGFloat, left: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
    UIEdgeInsets(
      top: vertical,
      left: left,
      bottom: vertical,
      right: right
    )
  }
    
  init(_ all: CGFloat) {
    self = EdgeInsets(top: all, leading: all, bottom: all, trailing: all)
  }
    
  init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
    self = EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
  }
    
  init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
    self = EdgeInsets(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
  }
    
  func with(left: CGFloat? = nil, right: CGFloat? = nil, top: CGFloat? = nil, bottom: CGFloat? = nil) -> UIEdgeInsets {
    UIEdgeInsets(
      top: top ?? self.top,
      left: left ?? self.left,
      bottom: bottom ?? self.bottom,
      right: right ?? self.right
    )
  }
    
  func with(horizontal: CGFloat, top: CGFloat? = nil, bottom: CGFloat? = nil) -> UIEdgeInsets {
    UIEdgeInsets(
      top: top ?? self.top,
      left: horizontal,
      bottom: bottom ?? self.bottom,
      right: horizontal
    )
  }
    
  func with(vertical: CGFloat, left: CGFloat? = nil, right: CGFloat? = nil) -> UIEdgeInsets {
    UIEdgeInsets(
      top: vertical,
      left: left ?? self.left,
      bottom: vertical,
      right: right ?? self.right
    )
  }
}

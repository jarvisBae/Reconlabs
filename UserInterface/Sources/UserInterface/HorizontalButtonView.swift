//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import SwiftUI

public struct HorizontalButtonView: View {
  let xClickAction: () -> Void
  let yClickAction: () -> Void
  let zClickAction: () -> Void
    
  public init(xClickAction: @escaping () -> Void, yClickAction: @escaping () -> Void, zClickAction: @escaping () -> Void) {
    self.xClickAction = xClickAction
    self.yClickAction = yClickAction
    self.zClickAction = zClickAction
  }
    
  public var body: some View {
    HStack {
      Button(action: xClickAction) {
        Text("x-axis rotation")
      }
      Spacer()
      Button(action: yClickAction) {
        Text("y-axis rotation")
      }
      Spacer()
      Button(action: zClickAction) {
        Text("z-axis rotation")
      }
    }
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
  }
}

struct HorizontalButtonView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      HorizontalButtonView(xClickAction: {}, yClickAction: {}, zClickAction: {})
    }
  }
}

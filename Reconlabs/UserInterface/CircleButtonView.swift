//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import SwiftUI

public struct CircleButtonView: View {
  let takePhoto: () -> Void
    
  public init(takePhoto: @escaping () -> Void) {
    self.takePhoto = takePhoto
  }
    
  public var body: some View {
    Button(action: takePhoto, label: {
      ZStack {
        Circle()
          .fill(Color.white)
          .frame(width: 60, height: 60)
        Circle()
          .stroke(Color.white, lineWidth: 4)
          .frame(width: 70, height: 70)
      }
    })
  }
}

struct CircleButtonView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      CircleButtonView {}
    }.background(Color.green)
  }
}

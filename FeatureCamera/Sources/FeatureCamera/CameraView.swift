//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import SwiftUI
import UserInterface
import Util

public struct CameraView: View {
  public let onCloseClick: () -> Void
      
  public init(onCloseClick: @escaping () -> Void) {
    self.onCloseClick = onCloseClick
  }
    
  public var body: some View {
    VStack {
      HStack {
        ButtonView(title: "Close", imageName: "xmark", width: 120, height: 60, action: onCloseClick)
        Spacer()
      }
      .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
  }
}

struct CameraView_Previews: PreviewProvider {
  static var previews: some View {
    CameraView {}
  }
}

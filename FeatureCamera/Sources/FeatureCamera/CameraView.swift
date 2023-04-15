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
    ZStack {
      CameraPreviewView()
      VStack {
        HStack {
          ButtonView(title: "Close", imageName: "xmark", width: 120, height: 60, action: onCloseClick)
          Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        Spacer()
        HorizontalButtonView(xClickAction: {
          Log.d("x click")
        }, yClickAction: {
          Log.d("y click")
        }, zClickAction: {
          Log.d("z click")
        })
        CircleButtonView {
          Log.d("capture click")
        }
      }
      .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
  }
}

struct CameraView_Previews: PreviewProvider {
  static var previews: some View {
    CameraView {}
  }
}

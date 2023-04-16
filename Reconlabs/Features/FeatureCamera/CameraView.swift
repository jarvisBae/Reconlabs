//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import CoreData
import SwiftUI

public struct CameraView: View {
  let coreDataHelper: CoreDataHelper
  let onCloseClick: () -> Void
  @State private var arView: ARView
  
  init(coreDataHelper: CoreDataHelper, onCloseClick: @escaping () -> Void) {
    self.coreDataHelper = coreDataHelper
    self.onCloseClick = onCloseClick
    self._arView = State(initialValue: ARView(coreDataHelper: coreDataHelper))
  }
    
  public var body: some View {
    ZStack {
      arView.edgesIgnoringSafeArea(.all)
      VStack {
        HStack {
          ButtonView(title: "Close", imageName: "xmark", width: 120, height: 60, action: onCloseClick)
          Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        Spacer()
        HorizontalButtonView(xClickAction: {
          arView.transformX()
        }, yClickAction: {
          arView.transformY()
        }, zClickAction: {
          arView.transformZ()
        })
        CircleButtonView(takePhoto: {
          arView.takePhoto()
        })
      }
      .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
  }
}

struct CameraView_Previews: PreviewProvider {
  static var previews: some View {
    Text("CameraView")
  }
}

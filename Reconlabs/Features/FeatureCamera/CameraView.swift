//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import CoreData
import SwiftUI

public struct CameraView: View {
  @ObservedObject private var viewModel: CameraPreviewViewModel
  public let onCloseClick: () -> Void
      
  public init(context: NSManagedObjectContext, onCloseClick: @escaping () -> Void) {
    self.onCloseClick = onCloseClick
    self.viewModel = CameraPreviewViewModel(context: context)
  }
    
  public var body: some View {
    ZStack {
      CameraPreviewView(viewModel: viewModel)
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
          viewModel.takePhoto()
        }
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

//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import AVFoundation
import SwiftUI

public struct CameraPreviewView: View {
  @ObservedObject public var viewModel: CameraPreviewViewModel
  
  public init(viewModel: CameraPreviewViewModel) {
    self.viewModel = viewModel
  }
  
  public var body: some View {
    AVCaptureSessionPreview(session: viewModel.cameraSession)
      .onAppear {
        viewModel.configureSession()
        viewModel.startSession()
      }
      .onDisappear {
        viewModel.stopSession()
      }
  }
}

struct CameraPreviewView_Previews: PreviewProvider {
  static var previews: some View {
    Text("Camera Preview")
  }
}

//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
 
import AVFoundation
import SwiftUI
import UIKit

struct AVCaptureSessionPreview: UIViewRepresentable {
  let session: AVCaptureSession

  func makeUIView(context _: Context) -> UIView {
    let view = UIView()
    let previewLayer = AVCaptureVideoPreviewLayer(session: session)
    previewLayer.videoGravity = .resizeAspectFill
    view.layer.addSublayer(previewLayer)
        
    DispatchQueue.main.async {
      previewLayer.frame = view.bounds
    }

    return view
  }

  func updateUIView(_ uiView: UIView, context _: Context) {
    if let previewLayer = uiView.layer.sublayers?.first as? AVCaptureVideoPreviewLayer,
       previewLayer.frame != uiView.bounds
    {
      previewLayer.frame = uiView.bounds
    }
  }
}

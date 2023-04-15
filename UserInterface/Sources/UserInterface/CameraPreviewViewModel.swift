//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import AVFoundation
import SwiftUI

class CameraPreviewViewModel: ObservableObject {
  @Published var cameraSession = AVCaptureSession()
  private let sessionQueue = DispatchQueue(label: "cameraSessionQueue")
    
  func configureSession() {
    cameraSession.beginConfiguration()
    
    guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
          let input = try? AVCaptureDeviceInput(device: camera),
          cameraSession.canAddInput(input)
    else {
      print("Failed to configure input")
      return
    }
        
    cameraSession.addInput(input)
        
    let output = AVCaptureVideoDataOutput()
    if cameraSession.canAddOutput(output) {
      cameraSession.addOutput(output)
    } else {
      print("Failed to configure output")
      return
    }
        
    cameraSession.commitConfiguration()
  }
    
  func startSession() {
    sessionQueue.async {
      if !self.cameraSession.isRunning {
        self.cameraSession.startRunning()
      }
    }
  }
    
  func stopSession() {
    sessionQueue.async {
      if self.cameraSession.isRunning {
        self.cameraSession.stopRunning()
      }
    }
  }
}

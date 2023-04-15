//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import AVFoundation
import CoreData
import Photos
import SwiftUI

protocol CameraPreviewProtocol {
  func startSession()
  func stopSession()
  func takePhoto()
  func savePhotoToCoreData(imageData: Data)
  func loadPhotosFromCoreData() -> [NPhotoEntity]
}

public class CameraPreviewViewModel: NSObject, ObservableObject {
  @Published var cameraSession = AVCaptureSession()
  private var photoOutput = AVCapturePhotoOutput()
  private let sessionQueue = DispatchQueue(label: "cameraSessionQueue")
  let coreDataHelper: CoreDataHelper
  
  public init(context: NSManagedObjectContext) {
    self.coreDataHelper = CoreDataHelper(context: context)
    super.init()
  }
    
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
    
    if cameraSession.canAddOutput(photoOutput) {
      cameraSession.addOutput(photoOutput)
    } else {
      print("Failed to configure photo output")
    }
        
    cameraSession.commitConfiguration()
  }
}

extension CameraPreviewViewModel: AVCapturePhotoCaptureDelegate {
  public func photoOutput(_: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error _: Error?) {
    guard let imageData = photo.fileDataRepresentation() else {
      print("Failed to get image data from captured photo")
      return
    }

    savePhotoToCoreData(imageData: imageData)
  }
}

extension CameraPreviewViewModel: CameraPreviewProtocol {
  /// session start
  func startSession() {
    sessionQueue.async {
      if !self.cameraSession.isRunning {
        self.cameraSession.startRunning()
      }
    }
  }
    
  /// session stop
  func stopSession() {
    sessionQueue.async {
      if self.cameraSession.isRunning {
        self.cameraSession.stopRunning()
      }
    }
  }
  
  /// take photo
  public func takePhoto() {
    let photoSettings = AVCapturePhotoSettings()
    photoOutput.capturePhoto(with: photoSettings, delegate: self)
  }
  
  /// save photo
  public func savePhotoToCoreData(imageData: Data) {
    coreDataHelper.savePhoto(imageData: imageData)
  }
  
  /// load photos
  func loadPhotosFromCoreData() -> [NPhotoEntity] {
    coreDataHelper.loadPhotos()
  }
}

//
//  Reconlabs
//
// Created by Jarvis Bae on 2023/04/16.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import ARKit
import AVFoundation
import SwiftUI

enum SystemSound: UInt32 {
  case shutter = 1108
}

protocol ARViewProtocol {
  func takePhoto()
  func playSound(_ sound: SystemSound)
}

struct ARView: UIViewRepresentable, ARViewProtocol {
  typealias UIViewType = ARSCNView
  
  static var arView = ARSCNView(frame: .zero)
  let coreDataHelper: CoreDataHelper

  init(coreDataHelper: CoreDataHelper) {
    self.coreDataHelper = coreDataHelper
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIView(context: Context) -> ARSCNView {
    let arView = ARView.arView
    arView.delegate = context.coordinator
    arView.scene = SCNScene()
    
    let configuration = ARWorldTrackingConfiguration()
    configuration.planeDetection = .horizontal
    arView.session.run(configuration)
    
    return arView
  }
  
  func updateUIView(_: ARSCNView, context _: Context) {}
  
  func takePhoto() {
    playSound(.shutter)
    
    let captureImage = ARView.arView.snapshot()
    guard let imageData = captureImage.pngData() else { return }
    coreDataHelper.savePhoto(imageData: imageData)
  }
  
  func playSound(_ sound: SystemSound) {
    AudioServicesPlaySystemSound(sound.rawValue)
  }
  
  class Coordinator: NSObject, ARSCNViewDelegate {
    var arView: ARView
    
    init(_ arView: ARView) {
      self.arView = arView
    }
    
    func renderer(_: SCNSceneRenderer, didAdd _: SCNNode, for anchor: ARAnchor) {}
  }
}

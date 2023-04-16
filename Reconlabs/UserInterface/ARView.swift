//
//  Reconlabs
//
// Created by Jarvis Bae on 2023/04/16.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0

import ARKit
import AVFoundation
import SwiftUI
import UIKit

enum SystemSound: UInt32 {
  case shutter = 1108
}

enum Transform {
  case xAngle
  case yAngle
  case zAngle
}

protocol ARViewProtocol {
  func takePhoto()
  func playSound(_ sound: SystemSound)
  func transformX()
  func transformY()
  func transformZ()
}

struct ARView: UIViewRepresentable, ARViewProtocol {
  typealias UIViewType = ARSCNView
  typealias TransactionClosure = () -> Void
  
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
    arView.automaticallyUpdatesLighting = true
    arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    
    let configuration = ARWorldTrackingConfiguration()
    configuration.planeDetection = [.horizontal, .vertical]
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
  
  func transformX() {
    guard let coordinator = ARView.arView.delegate as? Coordinator else { return }
    guard let boxNode = coordinator.boxNode else { return }
      
    rotateBoxNode(boxNode: boxNode, angle: .xAngle, numberOfRotations: 4)
  }
  
  func transformY() {
    guard let coordinator = ARView.arView.delegate as? Coordinator else { return }
    guard let boxNode = coordinator.boxNode else { return }
    
    rotateBoxNode(boxNode: boxNode, angle: .yAngle, numberOfRotations: 4)
  }
  
  func transformZ() {
    guard let coordinator = ARView.arView.delegate as? Coordinator else { return }
    guard let boxNode = coordinator.boxNode else { return }
    
    rotateBoxNode(boxNode: boxNode, angle: .zAngle, numberOfRotations: 4)
  }
  
  private func rotateBoxNode(boxNode: SCNNode, angle: Transform, numberOfRotations: Int) {
    guard numberOfRotations > 0 else { return }
    
    scnTransaction(boxNode: boxNode, angle: angle) {
      self.rotateBoxNode(boxNode: boxNode, angle: angle, numberOfRotations: numberOfRotations - 1)
    }
  }
  
  private func scnTransaction(boxNode: SCNNode, angle: Transform, _ completionBlock: @escaping TransactionClosure) {
    let oldTransform = boxNode.transform
    let rotation: SCNMatrix4
    
    switch angle {
    case .xAngle:
      rotation = SCNMatrix4MakeRotation(-GLKMathDegreesToRadians(90), 1, 0, 0)
      
    case .yAngle:
      rotation = SCNMatrix4MakeRotation(-GLKMathDegreesToRadians(90), 0, 1, 0)
      
    case .zAngle:
      rotation = SCNMatrix4MakeRotation(-GLKMathDegreesToRadians(90), 0, 0, 1)
    }
    
    SCNTransaction.begin()
    SCNTransaction.animationDuration = 0.1
    SCNTransaction.animationTimingFunction = CAMediaTimingFunction(name: .linear)
    boxNode.transform = SCNMatrix4Mult(rotation, oldTransform)
    SCNTransaction.completionBlock = completionBlock
    SCNTransaction.commit()
  }
  
  class Coordinator: NSObject, ARSCNViewDelegate {
    var arView: ARView
    var boxNode: SCNNode?
    var isBoxCreated: Bool = false
    
    init(_ arView: ARView) {
      self.arView = arView
    }
    
    private func createPlaneBox(anchor: ARPlaneAnchor) -> SCNNode? {
      let planeBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
      
      let planeNode = SCNNode(geometry: planeBox)
      
      planeNode.castsShadow = true
      planeNode.position = SCNVector3(anchor.center.x, 0, anchor.center.z)
      planeNode.simdPosition += simd_make_float3(0, 0, -0.5)
      
      let material = SCNMaterial()
      material.diffuse.contents = UIColor.red
      material.blendMode = .multiply
      material.roughness.contents = NSNumber(value: 0.5)
      material.metalness.contents = NSNumber(value: 0.5)
      planeBox.firstMaterial?.blendMode = .multiply
      material.lightingModel = .shadowOnly
      planeBox.materials = [material]
      ARView.arView.automaticallyUpdatesLighting = true
      
      return planeNode
    }
    
    func renderer(_: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
      guard !isBoxCreated, let planeAnchor = anchor as? ARPlaneAnchor else { return }
      if let box = createPlaneBox(anchor: planeAnchor) {
        node.addChildNode(box)
        boxNode = box
        isBoxCreated = true
      }
    }
  }
}

//
//  Reconlabs
//
// Created by Jarvis Bae on 2023/04/14.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import SwiftUI

@main
struct ReconlabsApp: App {
  let persistenceController = PersistenceController.shared
  let coreDataHelper = CoreDataHelper(context: PersistenceController.shared.container.viewContext)
  @State private var isPresented = false
  @State private var refreshToggle = false
  @Environment(\.dismiss) var dismiss

  var body: some Scene {
    WindowGroup {
      MainView(coreDataHelper: coreDataHelper, refreshToggle: $refreshToggle, onButtonClick: {
        isPresented.toggle()
        refreshToggle = false
      })
      .fullScreenCover(isPresented: $isPresented, content: {
        CameraView(coreDataHelper: coreDataHelper, arView: ARView(coreDataHelper: coreDataHelper), onCloseClick: {
          isPresented = false
          refreshToggle = true
        })
      })
    }
  }
}

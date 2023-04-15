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
  @State private var isPresented = false
  @State private var refreshToggle = false
  @Environment(\.dismiss) var dismiss

  var body: some Scene {
    WindowGroup {
      MainView(coreDataHelper: CoreDataHelper(context: persistenceController.container.viewContext), refreshToggle: $refreshToggle, onButtonClick: {
        isPresented.toggle()
        refreshToggle = false
      })
      .fullScreenCover(isPresented: $isPresented, content: {
        CameraView(context: persistenceController.container.viewContext, onCloseClick: {
          isPresented = false
          refreshToggle = true
        })
      })
    }
  }
}

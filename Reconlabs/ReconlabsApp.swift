//
//  Reconlabs
//
// Created by Jarvis Bae on 2023/04/14.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import FeatureCamera
import FeatureMain
import SwiftUI

@main
struct ReconlabsApp: App {
  let persistenceController = PersistenceController.shared
  @State private var isPresented = false
  @Environment(\.dismiss) var dismiss

  var body: some Scene {
    WindowGroup {
      MainView(onButtonClick: {
        isPresented.toggle()
      })
      .fullScreenCover(isPresented: $isPresented, content: {
        CameraView(onCloseClick: {
          isPresented = false
        })
      })
    }
  }
}

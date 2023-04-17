//
//
//
// Created by Jarvis Bae on 2023/04/14.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0

import CoreData
import SwiftUI

public struct MainView: View {
  let coreDataHelper: CoreDataHelper
  @Binding var refreshToggle: Bool
  let onButtonClick: () -> Void

  public var body: some View {
    NavigationView {
      VStack {
        ButtonView(title: "AR Camera", imageName: "camera", action: onButtonClick)
        Spacer()
        ImageGridView(refreshToggle: $refreshToggle, viewModel: ImageGridViewModel(coreDataHelper: coreDataHelper))
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    Text("")
  }
}

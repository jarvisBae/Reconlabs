//
//
//
// Created by Jarvis Bae on 2023/04/14.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0

import SwiftUI
import UserInterface
import Util

public struct MainView: View {
  public let onButtonClick: () -> Void
    
  public init(onButtonClick: @escaping () -> Void) {
    self.onButtonClick = onButtonClick
  }

  public var body: some View {
    NavigationView {
      VStack {
        ButtonView(title: "AR Camera", imageName: "camera", action: onButtonClick)
        Spacer()
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView {}
  }
}

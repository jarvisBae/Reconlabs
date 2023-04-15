//
//
//
// Created by Jarvis Bae on 2023/04/14.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0

import CoreData
import SwiftUI

public struct MainView: View {
  private var coreDataHelper: CoreDataHelper
  public let onButtonClick: () -> Void
    
  public init(context: NSManagedObjectContext, onButtonClick: @escaping () -> Void) {
    self.onButtonClick = onButtonClick
    self.coreDataHelper = CoreDataHelper(context: context)
  }

  public var body: some View {
    NavigationView {
      VStack {
        ButtonView(title: "AR Camera", imageName: "camera", action: onButtonClick)
        Spacer()
        List(coreDataHelper.loadPhotos(), id: \.self) { photo in
          Text("Photo ID : \(photo.description)")
        }
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    Text("main view")
  }
}

//
//  Reconlabs
//
// Created by Jarvis Bae on 2023/04/17.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0

import CoreData
import Foundation

class ImageGridViewModel: ObservableObject {
  @Published var photos: [NPhotoEntity] = []
  private var coreDataHelper: CoreDataHelper

  init(coreDataHelper: CoreDataHelper) {
    self.coreDataHelper = coreDataHelper
    loadPhotos()
  }

  func loadPhotos() {
    photos = coreDataHelper.loadPhotos()
  }
}

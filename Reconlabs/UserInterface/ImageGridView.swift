//
//  Reconlabs
//
// Created by Jarvis Bae on 2023/04/16.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import CoreData
import SwiftUI

struct ImageGridView: View {
  @Binding var refreshToggle: Bool
  let coreDataHelper: CoreDataHelper
  @State private var photos: [NPhotoEntity]
  
  init(refreshToggle: Binding<Bool>, coreDataHelper: CoreDataHelper) {
    self._refreshToggle = refreshToggle
    self.coreDataHelper = coreDataHelper
    self._photos = State(initialValue: coreDataHelper.loadPhotos())
  }
  
  private var columns: [GridItem] {
    var gridItems: [GridItem] = []
          
    for _ in 0 ..< min(photos.count, 3) {
      gridItems.append(GridItem(.flexible(), spacing: 16))
    }
    return gridItems
  }

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
        ForEach(photos, id: \.self) { photo in
          if let imageData = photo.imageData, let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
              .resizable()
              .scaledToFit()
          }
        }
      }
      .padding(.all)
      .onChange(of: refreshToggle) { _ in
        photos = coreDataHelper.loadPhotos()
      }
    }
  }
}

struct ImageGridView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {}
  }
}

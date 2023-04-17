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
  @ObservedObject var viewModel: ImageGridViewModel

  private var columns: [GridItem] {
    var gridItems: [GridItem] = []
          
    for _ in 0 ..< min(viewModel.photos.count, 3) {
      gridItems.append(GridItem(.flexible(), spacing: 16))
    }
    return gridItems
  }

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
        ForEach(viewModel.photos, id: \.self) { photo in
          if let imageData = photo.imageData, let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
              .resizable()
              .scaledToFit()
          }
        }
      }
      .padding(.all)
      .onChange(of: refreshToggle) { _ in
        viewModel.loadPhotos()
      }
    }
  }
}

struct ImageGridView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {}
  }
}

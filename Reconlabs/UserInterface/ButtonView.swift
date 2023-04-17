//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0

import SwiftUI

public struct ButtonView: View {
  let action: () -> Void
  @State public var title: String
  @State public var imageName: String
  @State public var width: CGFloat
  @State public var height: CGFloat
    
  public init(title: String, imageName: String, width: CGFloat = 250, height: CGFloat = 60, action: @escaping () -> Void) {
    self._title = State(initialValue: title)
    self._imageName = State(initialValue: imageName)
    self._width = State(initialValue: width)
    self._height = State(initialValue: height)
    self.action = action
  }
    
  public var body: some View {
    Button(action: action, label: {
      HStack {
        Image(systemName: imageName)
        Text(title)
          .tint(.white)
      }
      .padding()
      .background(Color.blue)
      .cornerRadius(20)
      .foregroundColor(.white)
    })
    .frame(width: width, height: height)
    .background(Color.blue)
    .cornerRadius(20)
  }
}

struct ButtonView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonView(title: "AR Camera", imageName: "camera") {
      
    }
  }
}

//
//
//
// Created by Jarvis Bae on 2023/04/14.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import Foundation

public enum Log {
  public static func d(
    _ msg: Any,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    #if DEBUG
      let fileName = file.split(separator: "/").last ?? ""
      let funcName = function.split(separator: "(").first ?? ""
      print("⚬ 🟢 [\(Date())] [\(fileName)] \(funcName)(\(line)) : \(msg)")
    #endif
  }
    
  public static func i(
    _ msg: Any,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    #if DEBUG
      let fileName = file.split(separator: "/").last ?? ""
      let funcName = function.split(separator: "(").first ?? ""
      print("⚬ 🔵 [\(Date())] [\(fileName)] \(funcName)(\(line)) : \(msg)")
    #endif
  }
    
  public static func e(
    _ msg: Any,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    let fileName = file.split(separator: "/").last ?? ""
    let funcName = function.split(separator: "(").first ?? ""
    print("⚬ 🔴 [\(Date())] [\(fileName)] \(funcName)(\(line)) : \(msg)")
  }
    
  public static func trace(
    _ message: String,
    function: String = #function,
    line: Int = #line
  ) {
    let funcName = function.split(separator: "(").first ?? ""
    print("✨ [\(message)] \(funcName):\(line)")
  }
}

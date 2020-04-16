//
//  Data+ConvertToUrl.swift
//  ActivityApp
//
//  Created by Tanya Burke on 4/16/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import Foundation


extension Data {
  // convert Data to a URL
    //use case example
    // let url = mediaObject.videoObject
  public func convertToURL() -> URL? {
    //create a temporary url
    //this is for temporary storage
    //documents directory is for permanent storage
    //caches directory is temporary storage
    
    //av player needs a url pointing to the location on disk
    let tempURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("video").appendingPathExtension("mp4")
    do {
      try self.write(to: tempURL, options: [.atomic])
      return tempURL
    } catch {
      print("failed to write to file url with error: \(error)")
    }
    return nil
  }
}

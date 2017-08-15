//
//  Meme.swift
//  MemeMe
//
//  Created by purpon on 10/May/2017.
//  Copyright © 2017 purpon. All rights reserved.
//

import Foundation
import UIKit

// Previous reviewers advised me to change some of the variables into constants here, but all this parametres are going to be changed in SAVE() func in MemeEditorViewController. So I'm not sure why, where and how I should perform this change.
// I've tried to make originalImage and memedImage into constants, but the program crashes.
// Would be great if you give me more explanation on this. Thanks!
// ¯\_(ツ)_/¯
struct Meme {
    var topText = ""
    var bottomText = ""
    var originalImage = UIImage()
    var memedImage = UIImage()
}

/*
struct Meme {
    
    // MARK: Properties
    
    let topText: String
    let bottomText: String
    let originalImage: UIImage
    let memedImage: UIImage
    
    static let TopTextKey = "TopTextKey"
    static let BottomTextKey = "BottomTextKey"
    static let OriginalImageKey = "OriginalImageKey"
    static let MemedImageKey = "MemedImageKey"
    
    // MARK: Initializer
    
    // Generate a Villain from a three entry dictionary
    
    init(dictionary: [String : String]) {
        
        self.topText = dictionary[Meme.TopTextKey]!
        self.bottomText = dictionary[Meme.BottomTextKey]!
        self.originalImage = dictionary[Meme.OriginalImageKey]!
        self.memedImage = dictionary[Meme.MemedImageKey]!
    }
}
*/

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


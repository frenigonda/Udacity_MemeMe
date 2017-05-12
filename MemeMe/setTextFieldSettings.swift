//
//  setTextFieldSettings.swift
//  MemeMe
//
//  Created by purpon on 10/May/2017.
//  Copyright © 2017 purpon. All rights reserved.
//

import Foundation
import UIKit

extension MemeEditorViewController {
    
    
    // Just a long func that I decided to hide here
    
    func setTextFieldSettings(_ textField: UITextField, text: String) {
        
        let textOutline = [NSFontAttributeName: UIFont(name: font ?? "HelveticaNeue-CondensedBlack", size: 40)!, NSForegroundColorAttributeName: UIColor.white, NSStrokeColorAttributeName: UIColor.black, NSStrokeWidthAttributeName: -5] as [String : Any]
        
        textField.text = ""
        textField.borderStyle = UITextBorderStyle.none
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: textOutline)
        textField.autocapitalizationType = .allCharacters
        textField.defaultTextAttributes = textOutline
        textField.textAlignment = NSTextAlignment.center
        textField.alpha = 1
        textField.keyboardType = UIKeyboardType.default
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.default
        textField.tintColor = UIColor.black
        imageForMeme.addSubview(textField)
        
    }

}


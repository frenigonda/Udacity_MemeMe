//
//  checkIfImageIsPicked.swift
//  MemeMe
//
//  Created by purpon on 10/May/2017.
//  Copyright © 2017 purpon. All rights reserved.
//

import Foundation
import UIKit

extension MemeEditorViewController {
    
    
    // Well, it works this way too
    func hideThemAll(_ shouldIHide: Bool, withCase: Int) {
        
        switch withCase {
        case 1 :
            navigationToolbar.isHidden = shouldIHide
            bottomToolbar.isHidden = shouldIHide
        default:
            navigationToolbar.isHidden = shouldIHide
            topTextField.isHidden = shouldIHide
            bottomTextField.isHidden = shouldIHide
        }
    }
    

    
    // Checking if image is picked and enabling/disabling toolbars and textfields accordingly
    
    func checkIfImageIsPicked() {
        
        if imageForMeme.image == nil {
            
            hideThemAll(true, withCase: 0)
            
        } else {
            
            hideThemAll(false, withCase: 0)
            
        }
    }
}


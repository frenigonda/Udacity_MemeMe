//
//  MemeEditorViewController.swift
//  MemeMe
//
//  Created by Dasha Sondak on 21/Mar/2017.
//  Copyright © 2017 purpon. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITextFieldDelegate {
    

    @IBOutlet weak var imageForMeme: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    @IBOutlet weak var navigationToolbar: UIToolbar!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    var keyboardHeight: CGFloat = 0
    var font: String? = "Impact"
    
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.self.addSubview(imageForMeme)
        imageForMeme.addSubview(bottomToolbar)
        imageForMeme.addSubview(navigationToolbar)
        
        setTextFieldSettings(topTextField, text: "TOP") // Look for additional file
        setTextFieldSettings(bottomTextField, text: "BOTTOM")
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        checkIfImageIsPicked() // Look for additional file
        
    }
    
    
    // MARK: Funcs for picking image from the gallery or creating a new photo

    @IBAction func getImageForMeme(_ sender: Any) {
        
        let getImageController = UIImagePickerController()
        getImageController.delegate = self
        
        if (sender as AnyObject).tag == 1 {
            getImageController.sourceType = .camera
        } else {
            getImageController.sourceType = .photoLibrary
        }
        
        present(getImageController, animated: true, completion: nil)
    }
    
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        checkIfImageIsPicked()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageForMeme.image = image
            imageForMeme.contentMode = .scaleAspectFit
            dismiss(animated: true, completion: nil)
            checkIfImageIsPicked()
        }
    }
    
    
    // MARK: Action for CANCEL button
    
    @IBAction func cancelMemeAction(_ sender: Any) {
        imageForMeme.image = nil
        topTextField.text = ""
        bottomTextField.text = ""
        hideThemAll(true, withCase: 0)
    }
    
    
    // MARK: Action for SHARE button and help funcs
    
    @IBAction func shareYourMemeWithEveryone(_ sender: Any) {
        
        let memeToShare = save()
        
        let shareController = UIActivityViewController(activityItems: [memeToShare.memedImage], applicationActivities: nil )
        shareController.popoverPresentationController?.sourceView = self.view
        present(shareController, animated: true, completion: nil)
        
    }
    
    // For Meme struct look for additional file
    func save() -> Meme {
        
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageForMeme.image!, memedImage: generateMemedImage())
        
        (UIApplication.shared.delegate as! AppDelegate).memes.append(meme)
        print("meme is saved")
        print((UIApplication.shared.delegate as! AppDelegate).memes)
        return meme
    }
    
    func generateMemedImage() -> UIImage {
        
        hideThemAll(true, withCase: 1)
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        hideThemAll(false, withCase: 1)
        
        return memedImage
    }
    
    
    // MARK: Funcs for lifting view when bottomTextField is being edited
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == bottomTextField {
            imageForMeme.frame.origin.y = keyboardHeight
        }
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        
        // Checking if camera is available on the device and enabling/disabling CAMERA button accordingly
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    func keyboardWillShow(_ notification:Notification) {
        if bottomTextField.isEditing {
            imageForMeme.frame.origin.y = 0 - getKeyboardHeight(notification)
        }
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        keyboardHeight = keyboardSize.cgRectValue.height
        return keyboardHeight
    }
    
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
    }

    
    
}


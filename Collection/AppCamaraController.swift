//
//  AppCamaraController.swift
//  Collection
//
//  Created by Omar Vladimir Galicia Palmeros on 22/11/16.
//  Copyright © 2016 Poppler. All rights reserved.
//


import UIKit

class AppCamaraController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var imagepicked: UIImageView!
    let picker = UIImagePickerController()
    
    
    @IBAction func openCamaraBoton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
}

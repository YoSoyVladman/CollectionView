//
//  ImagenViewController.swift
//  Collection
//
//  Created by Omar Vladimir Galicia Palmeros on 25/10/16.
//  Copyright © 2016 Poppler. All rights reserved.
//

import UIKit

class ImagenViewController: UIViewController {

    @IBOutlet weak var imagenView: UIImageView!
    
    var image = UIImage()
    
    @IBOutlet weak var titleDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagenView.image = UIImage(named: "mapa")
        self.titleDetail.text = self.title
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

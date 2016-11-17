//
//  ViewController.swift
//  Collection
//
//  Created by Omar Vladimir Galicia Palmeros on 25/10/16.
//  Copyright © 2016 Poppler. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let edificios = ["Ciudad de México","Prueba2","Prueba3","Prueba4","Prueba5","Prueba6","Prueba7","Prueba8","Prueba9","Prueba10","Prueba11","Prueba12","Prueba13","Prueba14"]
    let image = UIImage(named:"prueba")
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readPlist()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func readPlist(){
        if let plist = Plist(name: "Ciudades") {
            let dict = plist.getMutablePlistFile()!
            for(key,value) in dict{
                print(key)
                print(type(of:value))
                print("valor =  \(value)")
            }
        }
        else{
            print("Unable to get Plist")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.edificios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GaleriaCell
        
        cell.imageView?.image = self.image
        cell.titleLabel?.text = self.edificios[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showImage", sender:self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImage"
        {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            let indexPath = indexPaths[0] as NSIndexPath
            let vc = segue.destination as! ImagenViewController
            vc.title = self.edificios[indexPath.row]
            
            
        }
    }

}


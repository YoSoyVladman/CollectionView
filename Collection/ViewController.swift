//
//  ViewController.swift
//  Collection
//
//  Created by Omar Vladimir Galicia Palmeros on 25/10/16.
//  Copyright © 2016 Poppler. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let edificios = ["UNO","DOS","TRES","CUATRO","CINCO","SEIS"]
    let image = UIImage(named:"prueba")
    
    let YearBornKey = "YearBorn"
    let FavoriteFoodKey = "FavoriteFood"
    let IsSettingOnKey = "IsSettingOn"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //1
        if let plist = Plist(name: "data") {
            //2
            let dict = plist.getMutablePlistFile()!
            dict[YearBornKey] = 1979
            //3
            do {
                try plist.addValuesToPlistFile(dictionary: dict)

            } catch {
                print(error)
            }
            //4
            print(plist.getValuesInPlistFile())
        } else {
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
            
            vc.image = self.image!
            vc.title = self.edificios[indexPath.row]
            
            
        }
    }

}


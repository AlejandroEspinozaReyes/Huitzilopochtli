//
//  IOTFeedCollectionViewController.swift
//  IOT
//
//  Created by Developer on 12/4/17.
//  Copyright © 2017 IOT. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class IOTFeedCollectionViewController: UICollectionViewController {

    var imageArray: [UIImage] = []
    var kindArray:  [String] = []
    var placeArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.imageArray = [#imageLiteral(resourceName: "door"),#imageLiteral(resourceName: "fan"),#imageLiteral(resourceName: "gamepad"),#imageLiteral(resourceName: "key"),#imageLiteral(resourceName: "laundry"),#imageLiteral(resourceName: "locked"),#imageLiteral(resourceName: "locked (1)"),#imageLiteral(resourceName: "light-bulb"),#imageLiteral(resourceName: "light-bulb (1)")]
        self.kindArray = ["Puerta","Ventilador","PS4","CF","Lavadora","Puerta","Puerta","Foco","Foco"]
        self.placeArray = ["Entrada","Recamara","Principal","Recamara","Oficina","Recamara","Recamara","Recamara","Patio"]
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! IOTFeedCollectionViewCell
        
        if indexPath.row%2 == 0{
            cell.blurBackgorund.layer.cornerRadius = 10
            cell.blurBackgorund.isHidden = false
            cell.blurBackgorund.clipsToBounds = true
        }
        
        cell.imageBackGround.layer.cornerRadius = 10
        cell.imageBackGround.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.imageBackGround.layer.borderWidth = 0.1
    
        cell.imageIcon.image = imageArray[indexPath.row]
        cell.homePart.text = placeArray[indexPath.row]
        cell.kindOfDevice.text = kindArray[indexPath.row]
        
        if imageArray.count == indexPath.row {
            print("Ultima cellda")
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

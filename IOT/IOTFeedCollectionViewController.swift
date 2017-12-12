//
//  IOTFeedCollectionViewController.swift
//  IOT
//
//  Created by Developer on 12/4/17.
//  Copyright © 2017 IOT. All rights reserved.
//

import UIKit
import SnapKit

private let reuseIdentifier = "Cell"

class IOTFeedCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

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
        
        return cell
        
       }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "headerView",
                                                                             for: indexPath) as! IOTHeaderCollectionReusableView
            
            headerView.plusButton.layer.cornerRadius = 20
            headerView.plusButton.clipsToBounds = true
            headerView.gettingHomeButton.layer.cornerRadius = 5
            headerView.gettingHomeButton.clipsToBounds = true
            headerView.inHomeButton.layer.cornerRadius = 5
            headerView.inHomeButton.clipsToBounds = true
            headerView.outOfHomeButton.layer.cornerRadius = 5
            headerView.outOfHomeButton.clipsToBounds = true

            
            
            return headerView
        default:
            fatalError("this is NOT should happen!!")
        }
    }
}

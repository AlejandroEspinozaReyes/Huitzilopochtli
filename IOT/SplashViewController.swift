//
//  SplashViewController.swift
//  IOT
//
//  Created by Developer on 12/4/17.
//  Copyright © 2017 IOT. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIView!
    @IBOutlet weak var segueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.layer.cornerRadius = 150
        logoImageView.clipsToBounds = true
        showFaceIdAnimation()
    }
    
    func showFaceIdAnimation(){
        
        UIView.animate(withDuration: 0.5, animations: {
            
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.autoreverse, .repeat], animations: {
                self.logoImageView.frame.size.width += 5
                self.logoImageView.frame.size.height += 5
                self.logoImageView.alpha = 0.5
                self.logoImageView.alpha = 1.0
            })
            self.delayWithSeconds(2 , completion: {
                self.segueButton.sendActions(for: UIControlEvents.touchUpInside)
            })
        }
    }
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    

}

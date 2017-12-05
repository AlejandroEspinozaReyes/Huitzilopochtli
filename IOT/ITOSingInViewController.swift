//
//  ITOSingInViewController.swift
//  IOT
//
//  Created by Developer on 12/4/17.
//  Copyright © 2017 IOT. All rights reserved.
//

import UIKit

class ITOSingInViewController: UIViewController {
    
    struct Geometrics {
        static let cornerRadius : CGFloat = 30
    }
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var singInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.configuringElementsLayer()
        
    }
    
    func configuringElementsLayer(){
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"password", attributes:[NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font :UIFont(name: "Butler", size: 20)!])
        
        userNameTextField.attributedPlaceholder = NSAttributedString(string:"username", attributes:[NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font :UIFont(name: "Butler", size: 20)!])
        
        passwordTextField.layer.cornerRadius = Geometrics.cornerRadius
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 2.0
        passwordTextField.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        userNameTextField.layer.cornerRadius = Geometrics.cornerRadius
        userNameTextField.clipsToBounds = true
        userNameTextField.layer.borderWidth = 2.0
        userNameTextField.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        singInButton.layer.cornerRadius = Geometrics.cornerRadius
        singInButton.clipsToBounds = true
        
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement )
        UIView.commitAnimations()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func singInButtonTapped(_ sender: Any) {
        
        guard let email = userNameTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        
//        Auth.auth().signIn(withEmail: email, password: password)  {(user, error) in
//            if error != nil {
//                print(error.debugDescription)
//
//                return
//            }else{
//                print("Successfully authenticated")
//
//
//            }
//            /*
//             // MARK: - Navigation
//
//             // In a storyboard-based application, you will often want to do a little preparation before navigation
//             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//             // Get the new view controller using segue.destinationViewController.
//             // Pass the selected object to the new view controller.
//             }
//             */
//
//        }
//
  }

}

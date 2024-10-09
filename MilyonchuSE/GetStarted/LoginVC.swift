//
//  LoginVC.swift
//  MilyonchuSE
//
//  Created by Javidan on 05.10.24.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var pwdTf: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var pwdLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var dontHaveLbl: UILabel!
    @IBOutlet weak var mainLoginButton: UIButton!
    @IBOutlet weak var welcomeBackLbl: UILabel!

    var userData: UserData?
    
    @IBOutlet weak var mailError: UILabel!
    @IBOutlet weak var passError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = userData {
            emailTF.text = user.username
            pwdTf.text = user.password
        }
    }
    
    @IBAction func login(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else {
            mailError.isHidden = false
            return
        }
        guard let password = pwdTf.text, !password.isEmpty else {
            passError.isHidden = false
            return
        }

        let newUser = UserData(username: email, password: password, email: email)
        userData = newUser
        
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }

    @IBAction func clickSignUpButton(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
//    @IBAction func loginButton(_ sender: UIButton) {
//        let nextVC = storyboard?.instantiateViewController(withIdentifier: "Body") as! ViewController
//        navigationController?.pushViewController(nextVC, animated: true)
//    }
}

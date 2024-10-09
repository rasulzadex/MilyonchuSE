import UIKit

class SignUpVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createAccLbl: UILabel!
    @IBOutlet weak var findLabel: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var alreadyAccLbl: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var pwdLbl: UILabel!
    @IBOutlet weak var pwdTF: UITextField!
    
    var registerClicked: ((UserData)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        emailTF.delegate = self
        pwdTF.delegate = self
        
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.black.cgColor
        nameTF.layer.cornerRadius = 5
        
        emailTF.layer.borderWidth = 1
        emailTF.layer.borderColor = UIColor.black.cgColor
        emailTF.layer.cornerRadius = 5
        
        pwdTF.layer.borderWidth = 1
        pwdTF.layer.borderColor = UIColor.black.cgColor
        pwdTF.layer.cornerRadius = 5
        
        signUpButton.layer.cornerRadius = 10

        registerClicked = { [weak self] userData in
            let nextVC = self?.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            nextVC.userData = userData
            self?.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    @IBAction func clickSignUpButton(_ sender: UIButton) {
        guard let username = nameTF.text, username.count >= 4 else {
            return
        }
        
        guard let pass = pwdTF.text, pass.count >= 8 else {
            return
        }
        
        guard let email = emailTF.text, isValidEmail(email: email) else {
            return
        }
        
        let newUser = UserData(username: username, password: pass, email: email)
        registerClicked?(newUser)
        
        nameTF.text = ""
        pwdTF.text = ""
        emailTF.text = ""
        
        print(newUser)
    }
    
    @IBAction func clickLoginButton(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        nameTF.layer.borderColor = UIColor.clear.cgColor
        pwdTF.layer.borderColor = UIColor.clear.cgColor
        emailTF.layer.borderColor = UIColor.clear.cgColor
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case nameTF:
            if let name = nameTF.text, name.isEmpty || name.count < 4 {
                nameTF.layer.borderColor = UIColor.red.cgColor
            } else {
                nameTF.layer.borderColor = UIColor.green.cgColor
            }
        case pwdTF:
            if let pass = pwdTF.text, pass.isEmpty || pass.count < 8 {
                pwdTF.layer.borderColor = UIColor.red.cgColor
            } else {
                pwdTF.layer.borderColor = UIColor.green.cgColor
            }
        case emailTF:
            if let email = emailTF.text, !isValidEmail(email: email) {
                emailTF.layer.borderColor = UIColor.red.cgColor
            } else {
                emailTF.layer.borderColor = UIColor.green.cgColor
            }
        default: break
        }
    }
}

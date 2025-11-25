//
//  ViewController.swift
//  demoApp
//
//  Created by Pravinkumar on 14/11/25.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameTextBox: UITextField!
    
    @IBOutlet weak var emailTextBox: UITextField!
    
    @IBOutlet weak var phoneTextBox: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
        private let kUsername = "username"
        private let kEmail = "email"
        private let kMobile = "mobile"
        private let kIsLoggedIn = "kIsLoggedIn"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        print("\(kIsLoggedIn)")
        print(UserDefaults.standard.bool(forKey: kIsLoggedIn))
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                print("viewDidAppear loading....")
                performSegue(withIdentifier: "secondViewController", sender: nil)
                
            }
        }
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let username = nameTextBox.text ?? ""
        
        let email = emailTextBox.text ?? ""
        
        let phoneNumber = phoneTextBox.text ?? ""
        
        if username.isEmpty {
                showAlert(message: "Please enter your username")
                return
            }
        
        if email.isEmpty {
                showAlert(message: "Please enter your email")
                return
            }
        
        if !isValidEmail(email) {
                showAlert(message: "Please enter a valid email address")
                return
            }
        
        if phoneNumber.isEmpty {
                showAlert(message: "Please enter your phone number")
                return
            }
        
        if let firstChar = phoneNumber.first,
           let firstDigit = Int(String(firstChar)),
           firstDigit < 6 {

            showAlert(message: "Phone number must start with 6, 7, 8 or 9")
            return
        }
        
        if phoneNumber.count != 10 {
            showAlert(message: "Phone number must be 10 digits")
            return
        }
        
        
        UserDefaults.standard.set(username, forKey: kUsername)

        UserDefaults.standard.set(email, forKey: kEmail)
  
        UserDefaults.standard.set(phoneNumber, forKey: kMobile)
      
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
        
        
        
        performSegue(withIdentifier: "secondViewController", sender: nil)
        
        
    }
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func showAlert(message: String) {
        
        let alter = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alter.addAction(okButton)
        
        self.present(alter,animated: true)
    }
    
}


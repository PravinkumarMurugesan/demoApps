//
//  secondViewController.swift
//  demoApp
//
//  Created by Pravinkumar on 18/11/25.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var logoutButtonTapped: UIStackView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var sunRiseLabel: UILabel!
    
    @IBOutlet weak var sunsetLabel: UILabel!
    
    @IBOutlet weak var firstLightLabel: UILabel!
    
    @IBOutlet weak var lastRiseLabel: UILabel!
    
    @IBOutlet weak var dawnLabel: UILabel!
    
    @IBOutlet weak var totalView: UIView!
    
    private let kUsername = "username"
    private let kEmail = "email"
    private let kMobile = "mobile"
    private let kIsLoggedIn = "kIsLoggedIn"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namelabel.text = UserDefaults.standard.string(forKey: kUsername)
        
        emailLabel.text=UserDefaults.standard.string(forKey: kEmail)
        
        phoneNumberLabel.text = UserDefaults.standard.string(forKey: kMobile)
       
        bindViewModel()
        viewModel.fetchSunData()
        
        totalView.layer.cornerRadius = 15
        totalView.clipsToBounds = true
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           loadUserData()
       }
    func loadUserData() {
        let defaults = UserDefaults.standard
        namelabel.text = defaults.string(forKey: kUsername) ?? "No name"
        emailLabel.text = defaults.string(forKey: kEmail) ?? "No email"
        phoneNumberLabel.text = defaults.string(forKey: kMobile) ?? "No mobile"
    }
   
    
    @IBAction func logoutButtontapped(_ sender: Any) {
        let alert = UIAlertController(title: "Logout",
                                             message: "Are you sure you want to logout?",
                                             preferredStyle: .alert)

        let yes = UIAlertAction(title: "Yes", style: .destructive) { _ in
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey: self.kUsername)
            defaults.removeObject(forKey: self.kEmail)
            defaults.removeObject(forKey: self.kMobile)
            defaults.set(false, forKey: self.kIsLoggedIn)
            self.dismiss(animated: true)
            
        }
            let no = UIAlertAction(title: "No", style: .cancel, handler: nil)
            
            alert.addAction(yes)
            alert.addAction(no)
            
            present(alert, animated: true)
        
    }
    
        let viewModel = SunViewModel()

       
        func bindViewModel() {
            viewModel.onDataReceived = { data in
                self.dateLabel.text = data.date
                self.sunRiseLabel.text =  data.sunrise
                self.sunsetLabel.text = data.sunset
                self.firstLightLabel.text = data.firstLight
                self.lastRiseLabel.text = data.dawn
                self.dawnLabel.text = data.dusk
            }
        }
    }

    


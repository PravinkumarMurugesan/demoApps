//
//  FrontViewController.swift
//  demoApp
//
//  Created by Pravinkumar on 25/11/25.
//

import UIKit

class FrontViewController: UIViewController {

    private let kIsLoggedIn = "kIsLoggedIn"

    var timer: Timer?
    var currentPage = 0
    
    @IBOutlet weak var myPageController: UIPageControl!
    override func viewDidLoad() {
        print("viewDidLoad....")
        super.viewDidLoad()
        setupPageControl()
        startAutoScroll()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            print("viewdidappear....")
            self.routeAfterSplash()
        }
    }

    func routeAfterSplash() {
    
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                print("secondViewController is loading ...")
                performSegue(withIdentifier: "secondViewController", sender: nil)
                
            }else {
                performSegue(withIdentifier: "viewController", sender: nil)
            }
    }
    
    func setupPageControl() {
            myPageController.numberOfPages = 3
            myPageController.currentPage = 0
            myPageController.isUserInteractionEnabled = false
        }
        
        func startAutoScroll() {
            timer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(updatePage), userInfo: nil, repeats: true)
        }
        
        @objc func updatePage() {
            currentPage = (currentPage + 1) % 3
            myPageController.currentPage = currentPage
        }
        
        deinit {
            timer?.invalidate() //stops the timer when screen is closed - avoid memory leaks
        }
}




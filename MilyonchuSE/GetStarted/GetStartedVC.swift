//
//  ViewController.swift
//  MilyonchuSE
//
//  Created by Javidan on 04.10.24.
//

import UIKit

class GetStartedVC: UIViewController {

    

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var backgroundPicture: UIImageView!
    @IBOutlet weak var no1Label: UILabel!
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var laptopPicture: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()




    }
    
    
    @IBAction func clickButton(_ sender: UIButton) {
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            
            navigationController?.pushViewController(nextVC, animated: true)
        }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        let screenSize = UIScreen.main.bounds.size
////
//        
////        // Determine the font size based on the screen width
////        let fontSize: CGFloat = screenSize.width < 375 ? smallScreenFontSize : bigScreenFontSize
////        
////        // Set the label's font to bold
////        label.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
////        
////        // Enable multi-line support
////        welcomeLabel.numberOfLines = 0
////        welcomeLabel.lineBreakMode = .byWordWrapping
////        welcomeLabel.textAlignment = .center
////        
////        // Adjust the top constraint based on screen size
////        if screenSize.width < 400 {
////            labelTopConstraint.constant = 90 // For small screens
////        } else {
////            labelTopConstraint.constant = 108 // For larger screens
////        }
//        
//        // Apply the changes
////        view.layoutIfNeeded()
//    }
//

}


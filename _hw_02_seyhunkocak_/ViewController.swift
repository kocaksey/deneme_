//
//  ViewController.swift
//  _hw_02_seyhunkocak_
//
//  Created by Seyhun Koçak on 5.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func currencyButtonPressed(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {
            present(vc, animated: true)
            
        }
            
    }
    
}


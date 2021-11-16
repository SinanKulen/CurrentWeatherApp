//
//  ViewController.swift
//  CurrentWeatherApp
//
//  Created by Sinan Kulen on 16.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weatherButton: UIButton!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var havaDurumuLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonClicked(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "tableVC") as? TableViewController {
            vc.cityName = cityTextField.text!
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


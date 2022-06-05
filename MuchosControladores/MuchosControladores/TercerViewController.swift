//
//  TercerViewController.swift
//  MuchosControladores
//
//  Created by Cristian Bahamondes on 01-06-22.
//

import UIKit

class TercerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTapVolverInicio(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

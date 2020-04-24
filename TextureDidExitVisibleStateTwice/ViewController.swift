//
//  ViewController.swift
//  TextureDidExitVisibleStateTwice
//
//  Created by Chalermpong Satayavibul on 24/4/2563 BE.
//  Copyright © 2563 chalermpong. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openTableView(_ sender: Any) {
        let vc = MyASTableVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


//
//  StartVC.swift
//  MP1
//
//  Created by Aadhrik Kuila on 2/7/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

    var backgroundImg: UIImageView!
    var startB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImg = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height));
        backgroundImg.image = UIImage(named: "background")
        backgroundImg.contentMode = .scaleAspectFill;
        view.addSubview(backgroundImg);
        
        startB = UIButton(frame: CGRect(x: view.frame.width * 0.3,
                                        y: view.frame.height * 0.55,
                                        width: view.frame.width * 0.4,
                                        height: 60))
        startB.backgroundColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1.0)
        startB.layer.cornerRadius = 10
        startB.setTitle("Let's Play!", for: .normal)
        startB.setTitleColor(UIColor(red: 0/255, green: 50/255, blue: 98/255, alpha: 1.0), for: .normal)
        startB.addTarget(self, action: #selector(startToMain), for: .touchUpInside)
        view.addSubview(startB)
    }
    
    @objc func startToMain() {
        self.performSegue(withIdentifier: "startToMain", sender: self)
    }

}


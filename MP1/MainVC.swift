//
//  MainVC.swift
//  MP1
//
//  Created by Aadhrik Kuila on 2/7/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit

var main: Main! = nil

class MainVC: UIViewController {
    
    var pic: UIImageView!
    var a1: UIButton!
    var a2: UIButton!
    var a3: UIButton!
    var a4: UIButton!
    var statB: UIButton!
    var scoreLabel: UILabel!
    
    override func viewDidLoad() {
    
        self.view.backgroundColor = UIColor(red: 0/255, green: 50/255, blue: 98/255, alpha: 1.0)
        
        statB = UIButton(frame: CGRect(x: view.frame.width * 0.6, y: 60, width: view.frame.width * 0.3, height: 60))
        statB.backgroundColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1.0)
        statB.setTitleColor(UIColor(red: 0/255, green: 50/255, blue: 98/255, alpha: 1.0), for: .normal)
        statB.layer.cornerRadius = 12
        statB.setTitle("Stats", for: .normal)
        
        scoreLabel = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: 60, width: view.frame.width * 0.5, height: 60))
        scoreLabel.font = UIFont(name: scoreLabel.font.fontName, size: 30)
        scoreLabel.textColor = .white

        pic = UIImageView(frame: CGRect(x: view.frame.width * 0.1,
                                        y: 150,
                                        width: view.frame.width * 0.8,
                                        height: view.frame.height * 0.4))
        pic.contentMode = .scaleAspectFit
        view.addSubview(pic)
        
        a1 = UIButton(frame: CGRect(x: view.frame.width * 0.1,
                                    y: view.frame.height * 0.6,
                                    width: view.frame.width * 0.8,
                                    height: 60))
        a1.backgroundColor = UIColor(red: 253/255, green: 191/255, blue: 21/255, alpha: 1.0)
        a1.layer.cornerRadius = 16
        a1.setTitleColor(UIColor(red: 0/255, green: 50/255, blue: 98/255, alpha: 1.0), for: .normal)
        view.addSubview(a1)
        a2 = UIButton(frame: CGRect(x: view.frame.width * 0.1,
                                    y: view.frame.height * 0.6 + 80,
                                    width: view.frame.width * 0.8,
                                    height: 60))
        a2.backgroundColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1.0)
        a2.layer.cornerRadius = 16
        a2.setTitleColor(UIColor(red: 0/255, green: 50/255, blue: 98/255, alpha: 1.0), for: .normal)
        view.addSubview(a2)
        a3 = UIButton(frame: CGRect(x: view.frame.width * 0.1,
                                    y: view.frame.height * 0.6 + 160,
                                    width: view.frame.width * 0.8,
                                    height: 60))
        a3.backgroundColor = UIColor(red: 253/255, green: 171/255, blue: 21/255, alpha: 1.0)
        a3.layer.cornerRadius = 16
        a3.setTitleColor(UIColor(red: 0/255, green: 50/255, blue: 98/255, alpha: 1.0), for: .normal)
        view.addSubview(a3)
        a4 = UIButton(frame: CGRect(x: view.frame.width * 0.1,
                                    y: view.frame.height * 0.6 + 240,
                                    width: view.frame.width * 0.8,
                                    height: 60))
        a4.backgroundColor = UIColor(red: 253/255, green: 161/255, blue: 21/255, alpha: 1.0)
        a4.layer.cornerRadius = 16
        a4.setTitleColor(UIColor(red: 0/255, green: 50/255, blue: 98/255, alpha: 1.0), for: .normal)
        view.addSubview(a4)
        
        if main == nil {
            main = Main(vc: self)
        }
        main.run(vc: self)
    }
    
}

//
//  StatisticsVC.swift
//  MP1
//
//  Created by Aadhrik Kuila on 2/7/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit

class StatisticsVC: UIViewController {
    
    var closeB: UIButton!
    var streakLabel: UILabel!
    var lastThree: UILabel!
    var ans1pic: UIImageView!
    var ans2pic: UIImageView!
    var ans3pic: UIImageView!
    var ans1label: UILabel!
    var ans2label: UILabel!
    var ans3label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1.0)

        closeB = UIButton(frame: CGRect(x: view.frame.width * 0.1,
                                        y: 60,
                                        width: view.frame.width * 0.8,
                                        height: 60))
        closeB.backgroundColor = UIColor.red
        closeB.setTitle("Back to Game", for: .normal)
        closeB.layer.cornerRadius = 8
        closeB.addTarget(self, action: #selector(backToGame), for: .touchUpInside)
        view.addSubview(closeB)
        
        streakLabel = UILabel(frame: CGRect(x: 0,
                                       y: 134,
                                       width: view.frame.width,
                                       height: view.frame.height * 0.1))
        streakLabel.text = "Your Longest Streak is " + String(streak)
        streakLabel.font = UIFont(name: streakLabel.font.fontName, size: 30)
        streakLabel.textAlignment = .center
        streakLabel.textColor = .white
        view.addSubview(streakLabel)
        
        lastThree = UILabel(frame: CGRect(x: 0,
                                       y: view.frame.height * 0.24,
                                       width: view.frame.width,
                                       height: view.frame.height * 0.1))
        lastThree.text = "Your Last Three Answers"
        lastThree.font = UIFont(name: lastThree.font.fontName, size: 20)
        lastThree.textAlignment = .center
        lastThree.textColor = UIColor(red: 0/255, green: 50/255, blue: 98/255, alpha: 1.0)
        view.addSubview(lastThree)
        
        if lastAnswer3 != [] {
            ans3pic = UIImageView(frame: CGRect(x: view.frame.width * 0.1,
                                                y: view.frame.height * 0.34,
                                                width: 120,
                                                height: 120))
            ans3pic.contentMode = .scaleAspectFit
            let noWhitespace = lastAnswer3[0].components(separatedBy: .whitespaces).joined().lowercased()
            ans3pic.image = UIImage(named: noWhitespace)!
            view.addSubview(ans3pic)
            
            ans3label = UILabel(frame: CGRect(x: view.frame.width * 0.5,
                                              y: view.frame.height * 0.36,
                                              width: view.frame.width * 0.5,
                                              height: view.frame.height * 0.1))
            ans3label.text = lastAnswer3[1]
            ans3label.font = UIFont(name: ans3label.font.fontName, size: 30)
            ans3label.textColor = .white
            view.addSubview(ans3label)
        }
        
        if lastAnswer2 != [] {
            ans2pic = UIImageView(frame: CGRect(x: view.frame.width * 0.1,
                                                y: view.frame.height * 0.54,
                                                width: 120,
                                                height: 120))
            ans2pic.contentMode = .scaleAspectFit
            let noWhitespace = lastAnswer2[0].components(separatedBy: .whitespaces).joined().lowercased()
            ans2pic.image = UIImage(named: noWhitespace)!
            view.addSubview(ans2pic)
            
            ans2label = UILabel(frame: CGRect(x: view.frame.width * 0.5,
                                              y: view.frame.height * 0.56,
                                              width: view.frame.width * 0.5,
                                              height: view.frame.height * 0.1))
            ans2label.text = lastAnswer2[1]
            ans2label.font = UIFont(name: ans3label.font.fontName, size: 30)
            ans2label.textColor = .white
            view.addSubview(ans2label)
        }
        
        if lastAnswer1 != [] {
            ans1pic = UIImageView(frame: CGRect(x: view.frame.width * 0.1,
                                                y: view.frame.height * 0.74,
                                                width: 120,
                                                height: 120))
            ans1pic.contentMode = .scaleAspectFit
            let noWhitespace = lastAnswer1[0].components(separatedBy: .whitespaces).joined().lowercased()
            ans1pic.image = UIImage(named: noWhitespace)!
            view.addSubview(ans1pic)
            
            ans1label = UILabel(frame: CGRect(x: view.frame.width * 0.5,
                                              y: view.frame.height * 0.76,
                                              width: view.frame.width * 0.5,
                                              height: view.frame.height * 0.1))
            ans1label.text = lastAnswer1[1]
            ans1label.font = UIFont(name: ans3label.font.fontName, size: 30)
            ans1label.textColor = .white
            view.addSubview(ans1label)
        }
        
    }
    
    @objc func backToGame() {
        self.performSegue(withIdentifier: "statisticsToMain", sender: self)
    }
    
}

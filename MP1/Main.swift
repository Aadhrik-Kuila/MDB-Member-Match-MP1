//
//  Main.swift
//  MP1
//
//  Created by Aadhrik Kuila on 2/7/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit

var streak: Int = 0
var score: Int = 0
var lastAnswer1: [String] = []
var lastAnswer2: [String] = []
var lastAnswer3: [String] = []

class Main {
    
    var seconds = 5
    var timer: Timer! = nil
    var vc: MainVC! = nil
    var buttons: [UIButton] = []
    var currStreak = 0
    
    var names: [String] = ["Aadhrik Kuila", "Aayush Tyagi", "Abhinav Kejriwal", "Abhinav Koppu", "Aditya Yadav", "Ajay Merchia", "Alice Zhao", "Amy Shen", "Anand Chandra", "Andres Medrano", "Andrew Santoso", "Angela Dong", "Anika Bagga", "Anita Shen", "Anmol Parande", "Ashwin Aggarwal", "Austin Davis", "Ayush Kumar", "Brandon David", "Candace Chiang", "Candice Ye", "Carol Wang", "Cody Hsieh", "Daniel Andrews", "DoHyun Cheon", "Eric Kong", "Ethan Wong", "Fang Shuo", "Izzie Lau", "Jacqueline Zhang", "Jaiveer Singh", "Japjot Singh", "Jeffery Zhang", "Joey Hejna", "Julie Deng", "Justin Kim", "Kaden Dippe", "Kanyes Thaker", "Kayli Jiang", "Kiana Go", "Leon Kwak", "Levi Walsh", "Louie Mcconnell", "Max Miranda", "Melanie Cooray", "Michelle Mao", "Mohit Katyal", "Mudabbir Khan", "Natasha Wong", "Neha Nagabothu", "Nikhar Arora", "Noah Pepper", "Radhika Dhomse", "Richard Huang", "Sai Yandapalli", "Saman Virai", "Samantha Lee", "Sarah Tang", "Sharie Wang", "Shaurya Sanghvi", "Shiv Kushwah", "Shomil Jain", "Shreya Reddy", "Shubha Jagannatha", "Shubham Gupta", "Sinjon Santos", "Sourish Agarwal", "Srujay Korlakunta", "Stephen Jayakar", "Suyash Gupta", "Tiger Chen", "Tyler Reinecke", "Vaibhav Gattani", "Varun Jhunjhunwalla", "Victor Sun", "Vidya Ravikumar", "Vineeth Yeevani", "Wilbur Shi", "Will Oakley", "William Lu", "Xin Yi Chen", "Young Lin"]
    
    var memberIndex = 0
    
    var correctBIndex = 0
    
    init(vc: MainVC) {
        self.vc = vc
        timer = Timer()
    }
    
    func run(vc: MainVC) {
        self.vc = vc
        
        buttons = [vc.a1, vc.a2,
                   vc.a3, vc.a4]
        
        memberIndex = Int(arc4random_uniform(82))
        correctBIndex = 0
        getImageFor(names[memberIndex])
        setButtons(names[memberIndex])
        vc.statB.addTarget(self, action: #selector(goToStats), for: .touchUpInside)
        vc.view.addSubview(vc.statB)
        vc.scoreLabel.text = "Score: 0"
        vc.view.addSubview(vc.scoreLabel)
        start()
        vc.scoreLabel.text = "Score: " + String(score)
    }
    
    func getImageFor(_ name: String) {
        let noWhitespace = name.components(separatedBy: .whitespaces).joined().lowercased()
        vc.pic.image =  UIImage(named: noWhitespace)!
    }
    
    func setButtons(_ name: String) {
        var otherAnswers: [Int]
        otherAnswers = []
        correctBIndex = Int(arc4random_uniform(4))
        var memberIndex: Int
        for mem in 0...3 {
            if mem == correctBIndex {
                setCorrectButton(index: mem, name: name)
            } else {
                memberIndex = Int(arc4random_uniform(82))
                while (otherAnswers.contains(memberIndex) || memberIndex == self.memberIndex) {
                    memberIndex = Int(arc4random_uniform(82))
                }
                otherAnswers.append(memberIndex)
                setWrongButton(index: mem, name: names[memberIndex])
            }
        }
    }
    
    func setCorrectButton(index: Int, name: String) {
        buttons[index].removeTarget(nil, action: nil, for: .allEvents)
        buttons[index].setTitle(name, for: .normal)
        buttons[index].addTarget(self, action: #selector(correct), for: .touchUpInside)
    }
    
    func setWrongButton(index: Int, name: String) {
        buttons[index].removeTarget(nil, action: nil, for: .allEvents)
        buttons[index].setTitle(name, for: .normal)
        buttons[index].addTarget(self, action: #selector(wrong), for: .touchUpInside)
    }
    
    @objc func correct() {
        lastAnswer1 = lastAnswer2
        lastAnswer2 = lastAnswer3
        lastAnswer3 = []
        lastAnswer3.append(names[memberIndex])
        lastAnswer3.append("Right! :)")
        currStreak += 1
        if currStreak > streak {
            streak = currStreak
        }
        buttons[correctBIndex].backgroundColor = UIColor.green
        score += 1
        vc.scoreLabel.text = "Score: " + String(score)
        disable()
        seconds = 1
        reset()
    }
    
    @objc func wrong(_ sender: UIButton) {
        lastAnswer1 = lastAnswer2
        lastAnswer2 = lastAnswer3
        lastAnswer3 = []
        lastAnswer3.append(names[memberIndex])
        lastAnswer3.append("Wrong :(")
        if currStreak > streak {
            streak = currStreak
        }
        currStreak = 0
        sender.backgroundColor = UIColor.red
        disable()
        seconds = 1
        reset()
    }
    
    @objc func update() {
        seconds -= 1
        if seconds <= 0 {
            enable()
            memberIndex = Int(arc4random_uniform(82))
            getImageFor(names[memberIndex])
            setButtons(names[memberIndex])
            refresh()
            seconds = 5
            reset()
        }
    }
    
    func refresh() {
        vc.a1.backgroundColor = UIColor(red: 253/255, green: 191/255, blue: 21/255, alpha: 1.0)
        vc.a2.backgroundColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1.0)
        vc.a3.backgroundColor = UIColor(red: 253/255, green: 171/255, blue: 21/255, alpha: 1.0)
        vc.a4.backgroundColor = UIColor(red: 253/255, green: 161/255, blue: 21/255, alpha: 1.0)
    }
    
    func disable() {
        for b in buttons {
            b.isEnabled = false
        }
    }
    
    func enable() {
        for b in buttons {
            b.isEnabled = true
        }
    }
    
    func reset() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(self.update),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func pause() {
        timer.invalidate()
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(self.update),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func goToStats() {
        pause()
        vc.performSegue(withIdentifier: "mainToStatistics", sender: self)
    }
    
}

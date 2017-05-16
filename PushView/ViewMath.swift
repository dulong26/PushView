//
//  ViewMath.swift
//  PushView
//
//  Created by Vu Thanh Tung on 5/16/17.
//  Copyright © 2017 silverpear. All rights reserved.
//

import UIKit

class ViewMath: UIViewController {

    @IBOutlet weak var lbNum1: UILabel!
    @IBOutlet weak var lbNum2: UILabel!
    @IBOutlet weak var lbSign: UILabel!
    
    @IBOutlet weak var btResult1: UIButton!
    @IBOutlet weak var btResult2: UIButton!
    @IBOutlet weak var btResult3: UIButton!
    
    @IBOutlet weak var lbCountRight: UILabel!
    @IBOutlet weak var lbCountWrong: UILabel!
    var countRight = 0
    var countWrong = 0
    
    @IBOutlet weak var lbCountDown: UILabel!
    var time: Int = 0
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRandom()
        countRight = 0
        countWrong = 0
        lbCountRight.text = String(countRight)
        lbCountWrong.text = String(countWrong)
        
        time = 10
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewMath.countDown), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func btAction(_ sender: UIButton) {
        let choice = Int((sender.titleLabel?.text)!)
        let num1 = Int(lbNum1.text!)
        let num2 = Int(lbNum2.text!)
        let sign = lbSign.text
        
        if (sign == "+") {
            if (num1! + num2!) == choice! {
                countRight += 1
            } else {
                countWrong += 1
            }
        } else if sign == "-" {
            if (num1! - num2!) == choice! {
                countRight += 1
            } else {
                countWrong += 1
            }
        }
        
        lbCountRight.text = String(countRight)
        lbCountWrong.text = String(countWrong)
        
        setRandom()
    }
    
    //Choose random numbers
    func setRandom() {
        let random1 = Int(arc4random_uniform(5)) + 1
        let random2 = Int(arc4random_uniform(5)) + 1
        lbNum1.text = String(random1)
        lbNum2.text = String(random2)
        
        let randomSign = Int(arc4random_uniform(2))
        if randomSign == 0 {
            lbSign.text = "-"
        } else {
            lbSign.text = "+"
        }
        
        setResult(num1: random1, num2: random2, sign: lbSign.text!)
        
    }
    
    //Set results on buttons
    func setResult(num1: Int, num2: Int, sign: String) {
        
        var rightAnswer = 0
        if sign == "+" {
            rightAnswer = plus(p1: num1, p2: num2)
        } else if sign == "-" {
            rightAnswer = minus(p1: num1, p2: num2)
        }
        
        var result = [String(num1), String(num2), String(rightAnswer)]
        
        //Choose random position for answer
        var rand1, rand2, rand3: Int
        rand1 = Int(arc4random_uniform(3))
        repeat {
            rand2 = Int(arc4random_uniform(3))
            rand3 = Int(arc4random_uniform(3))
        } while (rand2 == rand1)||(rand3 == rand2)||(rand1 == rand3)
        
        btResult1.setTitle(result[rand1], for: .normal)
        btResult2.setTitle(result[rand2], for: .normal)
        btResult3.setTitle(result[rand3], for: .normal)
    }
    
    //Calculation
    func plus(p1: Int, p2: Int) -> Int {
        return (p1 + p2)
    }
    func minus(p1: Int, p2: Int) -> Int {
        return (p1 - p2)
    }
    
    func countDown() {
        time -= 1
        lbCountDown.text = String(time)
        if time == 0 {
            time = 10
        }
    }
}

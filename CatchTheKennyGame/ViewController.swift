//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Ashish Sharma on 12/22/2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Variables
    var score = 0
    var highscore = 0
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var ballsArray = [UIImageView]()
    
    //MARK: Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var ball1: UIImageView!
    @IBOutlet weak var ball2: UIImageView!
    @IBOutlet weak var ball3: UIImageView!
    @IBOutlet weak var ball4: UIImageView!
    @IBOutlet weak var ball5: UIImageView!
    @IBOutlet weak var ball6: UIImageView!
    @IBOutlet weak var ball7: UIImageView!
    @IBOutlet weak var ball8: UIImageView!
    @IBOutlet weak var ball9: UIImageView!
    @IBOutlet weak var ball10: UIImageView!
    @IBOutlet weak var ball11: UIImageView!
    @IBOutlet weak var ball12: UIImageView!
    @IBOutlet weak var ball13: UIImageView!
    @IBOutlet weak var ball14: UIImageView!
    @IBOutlet weak var ball15: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        scoreLabel.text = "Score: \(score)"
        
        //Highscore check
        if storedHighscore != nil {
            highscoreLabel.text = "Highscore: \(storedHighscore as! Int)"
        } else {
            highscoreLabel.text = "Highscore: 0"
        }
        
        
        
//MARK: - Images
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer13 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer14 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer15 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        ball1.isUserInteractionEnabled = true
        ball2.isUserInteractionEnabled = true
        ball3.isUserInteractionEnabled = true
        ball4.isUserInteractionEnabled = true
        ball5.isUserInteractionEnabled = true
        ball6.isUserInteractionEnabled = true
        ball7.isUserInteractionEnabled = true
        ball8.isUserInteractionEnabled = true
        ball9.isUserInteractionEnabled = true
        ball10.isUserInteractionEnabled = true
        ball11.isUserInteractionEnabled = true
        ball12.isUserInteractionEnabled = true
        ball13.isUserInteractionEnabled = true
        ball14.isUserInteractionEnabled = true
        ball15.isUserInteractionEnabled = true
        
        ball1.addGestureRecognizer(recognizer1)
        ball2.addGestureRecognizer(recognizer2)
        ball3.addGestureRecognizer(recognizer3)
        ball4.addGestureRecognizer(recognizer4)
        ball5.addGestureRecognizer(recognizer5)
        ball6.addGestureRecognizer(recognizer6)
        ball7.addGestureRecognizer(recognizer7)
        ball8.addGestureRecognizer(recognizer8)
        ball9.addGestureRecognizer(recognizer9)
        ball10.addGestureRecognizer(recognizer10)
        ball11.addGestureRecognizer(recognizer11)
        ball12.addGestureRecognizer(recognizer12)
        ball13.addGestureRecognizer(recognizer13)
        ball14.addGestureRecognizer(recognizer14)
        ball15.addGestureRecognizer(recognizer15)
        
        ballsArray = [ball1,ball2, ball3, ball4, ball5, ball6, ball7, ball8, ball9, ball10, ball11, ball12, ball13, ball14, ball15]
        
        
//MARK: - Timers
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideBall), userInfo: nil, repeats: true)
        
        hideBall()
        
    }
    
    @objc func hideBall() {
        for ball in ballsArray {
            ball.isHidden = true
        }
        
        let randomBall = ballsArray[Int.random(in: 0...14)]
        randomBall.isHidden = false
    }
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown() {
        counter -= 1
        if counter == 0 {
            timeLabel.text = "Time's Up!"
            timer.invalidate()
            hideTimer.invalidate()
            
            for ball in ballsArray {
                ball.isHidden = true
            }
            
            //HighScore
            if self.score > self.highscore {
                self.highscore = self.score
                highscoreLabel.text = "Highscore: \(self.highscore)"
                UserDefaults.standard.set(self.highscore, forKey: "highscore")
                
            }
            
            
            //Alert
            
            let alert = UIAlertController(title: "Time's Up!", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                //replay function
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideBall), userInfo: nil, repeats: true)
                
               	 
            }
            
            alert.addAction(replayButton)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        } else {
        timeLabel.text = String(counter)
        }
        
    }


}


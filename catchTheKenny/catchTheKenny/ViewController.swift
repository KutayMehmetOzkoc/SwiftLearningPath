//
//  ViewController.swift
//  catchTheKenny
//
//  Created by Kutay Mehmet Ozko on 8.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var kennyImageView: UIImageView!
    
    var time = Timer()
    var hideTimer = Timer()
    var counter = 0
    var score = 0
    var highScore = 0
    var startingPosition = 0
    var isStartButtonClicked = false
    var timeIsUp = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func startButtonClicked(_ sender: Any) {
        isStartButtonClicked = true;
        print(isStartButtonClicked)
        timeIsUp = false
        startGame()
    }
    
    func startGame(){
        
        if(isStartButtonClicked == true){
            
            counter = 10
            timerLabel.text = "Time: \(counter)"
            time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
            hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(spawn), userInfo: nil, repeats: true)
            scoreLabel.text = "Score: \(score)"
            
            let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
            if let newHighScore = storedHighScore as? Int {
                highScoreLabel.text = "High Score: \(newHighScore)"
                highScore = newHighScore
            } else {
                highScoreLabel.text = "High Score: 0"
            }
            
            kennyImageView.isUserInteractionEnabled = true
            let touchKenny = UITapGestureRecognizer(target: self, action: #selector(onTouchKenny))
            kennyImageView.addGestureRecognizer(touchKenny)
        }
    }
    
    @objc func startTimer() {
            timerLabel.text = "Time: \(counter)"
            counter -= 1
            
            if counter == 0 {
                timeIsUp = true
                time.invalidate()
                hideTimer.invalidate()
                timerLabel.text = "Time is over!⏰"
                
                let alert = UIAlertController(title: "Time is up!", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
                    (UIAlerAction) in
                    self.score = 0
                    self.scoreLabel.text = "Score: \(self.score)"
                    self.counter = 10
                    self.timerLabel.text = "Time \(self.counter)"
                    
                    self.time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.startTimer), userInfo: nil, repeats: true)
                    self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.spawn), userInfo: nil, repeats: true)
                    
                }
                alert.addAction(okButton)
                alert.addAction(replayButton)
                self.present(alert, animated: true, completion: nil)
            }
        }
    @objc func onTouchKenny() {
        if timeIsUp == true {
            return  // süreden sonra dokunma çalışmasın
        }
        
        score += 1
        scoreLabel.text = "Score: \(score)"
        
        if score > highScore {
            highScore = score
            highScoreLabel.text = "High Score: \(highScore) ✅"
            UserDefaults.standard.set(highScore, forKey: "highScore")
        }
    }
        
    @objc func spawn() {
                let kennyWidth = kennyImageView.frame.width
                let kennyHeight = kennyImageView.frame.height
                
                let viewWidth = view.frame.width
                let viewHeight = view.frame.height
                
                let xWidth = viewWidth - kennyWidth
                let yHeight = viewHeight - kennyHeight
                
                let randomX = CGFloat.random(in: 0...xWidth)
                let randomY = CGFloat.random(in: 0...yHeight)
                
                kennyImageView.frame.origin = CGPoint(x: randomX, y: randomY)
            }
}

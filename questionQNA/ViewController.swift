//
//  ViewController.swift
//  questionQNA
//
//  Created by 羅承志 on 2021/5/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var cartoonPicturesImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    //產生問題array
    var questions = [Question]()
    //題目
    var index = 0
    //顯示題數
    var count: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(topic: "1", answer: "皮卡丘")
        questions.append(question1)
        let question2 = Question(topic: "2", answer: "蠟筆小新")
        questions.append(question2)
        let question3 = Question(topic: "3", answer: "小小兵")
        questions.append(question3)
        let question4 = Question(topic: "4", answer: "派大星")
        questions.append(question4)
        let question5 = Question(topic: "5", answer: "章魚哥")
        questions.append(question5)
        let question6 = Question(topic: "6", answer: "海綿寶寶")
        questions.append(question6)
        let question7 = Question(topic: "7", answer: "史迪奇")
        questions.append(question7)
        let question8 = Question(topic: "8", answer: "米奇")
        questions.append(question8)
        let question9 = Question(topic: "9", answer: "米妮")
        questions.append(question9)
        let question10 = Question(topic: "10", answer: "多啦A夢")
        questions.append(question10)
        
        //隨機出題
        questions.shuffle()
        //設題目圖片ImageView
        cartoonPicturesImageView.image = UIImage(named: questions[index].topic)
        answerLabel.text = ""
        progressLabel.text = "\(count)/10"
    }

    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = questions[index].answer
    }
    
    @IBAction func speak(_ sender: UIButton) {
        var speechUtterance = AVSpeechUtterance()
        speechUtterance = AVSpeechUtterance(string: "\(answerLabel.text!)")
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechUtterance.rate = 0.5
        speechUtterance.pitchMultiplier = 1
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        index = index + 1
        count = count + 1
        if count == questions.count+1 {
            index = 0
            count = 1
            //隨機出題
            questions.shuffle()
        }
        cartoonPicturesImageView.image = UIImage(named: questions[index].topic)
        answerLabel.text = ""
        progressLabel.text = "\(count)/10"
        progressSlider.value = Float(count)
    }
}


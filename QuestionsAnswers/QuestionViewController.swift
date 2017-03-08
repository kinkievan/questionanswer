//
//  QuestionViewController.swift
//  QuestionsAnswers
//
//  Created by Kinki Lai on 2017/3/7.
//  Copyright © 2017年 Kinki Lai. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    struct QuestionAnswer{
        var question:String
        var choose:[String]=[]
        var answer:Int
    }
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var ChooseButtons: [UIButton]!
    
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var topic: UILabel!
    var examQuestions:[QuestionAnswer]=[]
    var list:[Int]=[]
    var score=0
    var answser:Int=0;
    var questionCount=0
    override func viewDidLoad() {
        super.viewDidLoad()
        setExamData()
        nextQuestion()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ChooseAction(_ sender: UIButton) {
        //let index=sender.currentTitle?.startIndex
        let userChooser=sender.tag

        if(userChooser==answser)
        {
            score=score+10
            scoreLabel.text="score:\(score)";
        }
        checkGame()
        
    }
    
    @IBAction func nextQuestionAction(_ sender: Any) {
        checkGame()
        
    }
    
    @IBAction func restartAction(_ sender: Any) {
        
        setExamData()
        nextQuestion()
        
    }
    func setExamData()
        
    {
        
        examQuestions.append(QuestionAnswer(question:"1.jpg",choose:["玉山","黃山","香山","泰山"],answer:4))
        examQuestions.append(QuestionAnswer(question:"2.jpg",choose:["小城","長城","短城","大城"],answer:2))
        examQuestions.append(QuestionAnswer(question:"3.jpg",choose:["黃山","夷山市","盧山","泰山"],answer:2))
        examQuestions.append(QuestionAnswer(question:"4.jpg",choose:["襄陽古城","麗江古城","寧遠古城","商丘古城"],answer:2))
        examQuestions.append(QuestionAnswer(question:"5.jpg",choose:["大足石刻","龍門石窟","雲岡石窟","須彌山石窟"],answer:1))
        examQuestions.append(QuestionAnswer(question:"6.jpg",choose:["香港大彿","蒙山大佛","八卦山大彿","樂山大彿"],answer:4))
        examQuestions.append(QuestionAnswer(question:"7.jpg",choose:["大足石刻","龍門石窟","雲岡石窟","須彌山石窟"],answer:3))
        examQuestions.append(QuestionAnswer(question:"8.jpg",choose:["唐太宗陵","秦始皇陵","明太祖陵","漢武帝陵"],answer:2))
        examQuestions.append(QuestionAnswer(question:"9.jpg",choose:["白楊溝","葡萄溝","九寨溝","臭水溝"],answer:3))
        examQuestions.append(QuestionAnswer(question:"10.jpg",choose:["平遙古城","麗江古城","寧遠古城","商丘古城"],answer:1))
        examQuestions.append(QuestionAnswer(question:"11.jpg",choose:["黃山","泰山","盧山","泰山"],answer:3))
        examQuestions.append(QuestionAnswer(question:"12.jpg",choose:["地壇","天壇","雨壇","上壇"],answer:2))
        examQuestions.append(QuestionAnswer(question:"13.jpg",choose:["五台山","夷山市","盧山","泰山"],answer:1))
        examQuestions.append(QuestionAnswer(question:"14.jpg",choose:["太湖","措湖","洞庭湖","西湖"],answer:4))
        examQuestions.append(QuestionAnswer(question:"15.jpg",choose:["天山","黃山","香山","泰山"],answer:1))
        examQuestions.append(QuestionAnswer(question:"16.jpg",choose:["平遙古城","麗江古城","西遞村","商丘古城"],answer:3))
        examQuestions.append(QuestionAnswer(question:"17.jpg",choose:["皇家陵寢","秦始皇陵","明太祖陵","漢武帝陵"],answer:1))
        examQuestions.append(QuestionAnswer(question:"18.jpg",choose:["夷山市","三清山","五台山","武當山"],answer:2))
        examQuestions.append(QuestionAnswer(question:"19.jpg",choose:["黃山","丹霞","香山","泰山"],answer:2))
        examQuestions.append(QuestionAnswer(question:"20.jpg",choose:["三清山","五台山","武當山","夷山市"],answer:3))
        score=0
        questionCount=0
        scoreLabel.text="score:\(score)";
        list=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    }
    func nextQuestion()
        
    {
        questionCount=questionCount+1
        
        let random=Int(arc4random())%list.count
        let index=list[random]
 
        for i in 0 ..< ChooseButtons.count{
            ChooseButtons[i].setTitle("\(i+1)\(examQuestions[index].choose[i])", for: UIControlState.normal)
        }
        list.remove(at: random)
        topic.text=String(questionCount)
        questionImageView.image=UIImage(named: examQuestions[index].question)
        answser=examQuestions[index].answer
        
    }
    func checkGame()
    {
        if(questionCount==10)
        {
            let alertController = UIAlertController(title: "猜題結束", message: "分數\(score)", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(
                title: "確認",
                style: .default,
                handler: {
                    action in self.setExamData()
            }
            )
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            setExamData()
            nextQuestion()
        }
        else
        {
            nextQuestion()
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

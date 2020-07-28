//
//  QuizViewController.swift
//  QNA
//
//  Created by guowei on 2020/7/28.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var QuizLabel: UILabel!
    @IBOutlet var Option: [UIButton]!
    @IBOutlet weak var ProgressView: UIProgressView! //進度條
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    var NumberQuiz=0 //目前為止第幾題
    var TestProgress:Float=0.0//Progress
    var QuizNumberarray=[0,1,2,3,4,5,6,7,8,9,10,11,12,13] //題目總數Array
    var array:[Int]=[]//Array 準備存入shuffled後的Array
    let formatter = DateComponentsFormatter() //使用formatter 方便轉換時間
    var Timecounter: TimeInterval = 300 //設定答題時間（單位秒數）
    var score=0 //紀錄得分
    var timer=Timer() //計時器
    var Quizs=[Quiz(Quiz: "第一隻iPhone販售時間?", Answer: "2007.6.29", choice:["2007.7.1","2007.7.10","2007.7.11","2007.6.29"]),
               Quiz(Quiz: "首次搭載指紋辨識的iPhone?", Answer: "iPhone 5S", choice:["iPhone 5S","iPhone 5","iPhone 4S","iPhone 4"]),
               Quiz(Quiz: "蘋果何時創立？", Answer: "1976.4.1", choice:["1984.1.1","1976.4.1","1980.12.9","1975.7.4"]),
               Quiz(Quiz: "如果你看到iPad上有XX就是搞砸了，請問Jobs嘲諷的東西是？", Answer: "觸控筆", choice:["觸控筆","鍵盤","滑鼠","Windows key"]),
               Quiz(Quiz: "iPhone在開發時被列為高度機密，請問它的代碼是什麼？", Answer: "Purple", choice:["Violet","Purple","Orange","Black"]),
               Quiz(Quiz: "Tim Cook接任CEO前，他任職於哪個部門？", Answer: "運輸和物流", choice:["硬體與軟體設計","銷售中心","運輸和物流","軟體開發"]),
               Quiz(Quiz: "Siri 從底幾代iPhone上出現？", Answer: "iPhone 4S", choice:[" iPhone 4","iPhone 4S"," iPhone 3GS"," iPhone 5"]),
               Quiz(Quiz: "Siri一詞在挪威語代表什麼意思？", Answer: "帶領你走向勝利的美麗女神", choice:["帶領你走向勝利的美麗女神","走向未來","智能科技方便未來","語音輸入"]),
               Quiz(Quiz: "iPad開發時，Jobs說他想要可以在哪邊使用的裝置？", Answer: "廁所", choice:["床","按摩浴缸","廁所","客廳"]),
               Quiz(Quiz: "蘋果公司股票代號?", Answer: "AAPL", choice:["APP","APPLE","AAPL","ALPA"]),
               Quiz(Quiz: "第一代iPhone4GB容量售價?", Answer: "499美元", choice:["499美元","299美元","399美元","199美元"]),
               Quiz(Quiz: "第一代iPad問世於?", Answer: "2010.4.3", choice:["2010.3.4","2010.4.3","2010.6.3","2010.7.3"]),
               Quiz(Quiz: "macOS Big Sur是macOS第幾個版本", Answer: "17", choice:["13","15","17","19"]),
               Quiz(Quiz: "iPhone5C唯一沒有的顏色是？", Answer: "黑", choice:["白","黑","藍","粉"])
    ]
               
    func ChangeQuiz(){
        QuizLabel.text=Quizs[array[NumberQuiz]].Quiz
        Option[0].setTitle(Quizs[array[NumberQuiz]].choice[0], for: .normal)
        Option[1].setTitle(Quizs[array[NumberQuiz]].choice[1], for: .normal)
        Option[2].setTitle(Quizs[array[NumberQuiz]].choice[2], for: .normal)
        Option[3].setTitle(Quizs[array[NumberQuiz]].choice[3], for: .normal)
        ScoreLabel.text="得分:\(score)"
        ProgressView.progress=TestProgress
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array=QuizNumberarray.shuffled()
        print(array)
        
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(runTimer) , userInfo: nil, repeats:true)
        
        
        
        ProgressView.transform=CGAffineTransform(scaleX: 1, y: 4) //修改Progress樣式
        
        ChangeQuiz()
        Option[0].layer.borderColor=UIColor.white.cgColor
        Option[1].layer.borderColor=UIColor.white.cgColor
        Option[2].layer.borderColor=UIColor.white.cgColor
        Option[3].layer.borderColor=UIColor.white.cgColor
        // Do any additional setup after loading the view.
    }
    // 點擊答案按鈕
    @IBAction func AnswerQuizBtn(_ sender: UIButton) {
        if let okAnswer=sender.currentTitle {
            print(okAnswer)
            print(Quizs[array[NumberQuiz]].Answer)
            if okAnswer==Quizs[array[NumberQuiz]].Answer{
                score=score+10
                print(score)
                
            }
    
    NumberQuiz=NumberQuiz+1
    TestProgress=TestProgress+0.1
            
    if NumberQuiz>9{ //當答題到10題切換畫面顯示分數
      GotoResult()
    }
            
    ChangeQuiz()
    
   
}
       
      
      
        
       
     
        
    }
    @objc func runTimer(){
        
    Timecounter-=1
    TimeLabel.text = formatter.string(from:Timecounter)
        if Timecounter<0 {
            GotoResult()
        }
        
    }
       
    func GotoResult(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier:"ResultViewController") as! ResultViewController
        controller.score=score
        present(controller, animated: true, completion: nil)
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

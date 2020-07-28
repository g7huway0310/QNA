//
//  ResultViewController.swift
//  QNA
//
//  Created by guowei on 2020/7/28.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var Showlabel: UILabel!
    
    var ImageArray=["woodapple","silverapple","goldapple","colorapple"]
    
    var score:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(score)
        
        ScoreLabel.text="得分:\(score)"
        button.layer.borderColor=UIColor.white.cgColor
        if score>70{
            imageView.image=UIImage(named: ImageArray[3])
            Showlabel.text="超 級 果 粉"
        }
        else if score>50{
            imageView.image=UIImage(named: ImageArray[2])
            Showlabel.text="金 牌 果 粉"
        }
        else if  score>30{
            imageView.image=UIImage(named: ImageArray[1])
            Showlabel.text="銀 牌 果 粉"
        }
        else if score<30{
            imageView.image=UIImage(named: ImageArray[0])
            Showlabel.text="果 粉 之 恥"
        }
        else if score==30{
            imageView.image=UIImage(named: ImageArray[0])
            Showlabel.text="果 粉 之 恥"
        }
        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func Tryagaion(_ sender: Any) {
        
        
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

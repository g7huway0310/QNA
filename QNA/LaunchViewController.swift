//
//  LaunchViewController.swift
//  QNA
//
//  Created by guowei on 2020/7/28.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {self.animate()
        })
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
       
    }
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size=self.view.frame.size.width*3
            let diffx=size - self.view.frame.size.width
            let diffy=self.view.frame.size.height-size
            self.imageView.frame=CGRect(
                x: -(diffx/2),
                y: diffy/2,
                width: size,
                height: size)
        })
        
        UIView.animate(withDuration: 0.8, animations: {
                   
        self.imageView.alpha=0
                                        
        },completion: {done in
            if done{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier:"QuizViewController") as! QuizViewController
                controller.modalTransitionStyle = .crossDissolve //設轉場為交叉淡化
                controller.modalPresentationStyle = .fullScreen //設定present為全螢幕
                 self.present(controller, animated: true)
                
            }
        })
        
      
        
        
        
        
        
                  
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

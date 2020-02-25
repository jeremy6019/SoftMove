//
//  ViewController.swift
//  SoftMove
//
//  Created by 503 on 2020/02/25.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    //물체가 도덜할 목표지점
    var targetX:CGFloat = 0
    var targetY:CGFloat = 0
    
    
    @IBAction func btn_click(_ sender: Any) {
        move()
    }
    
    @IBAction func btn_auto(_ sender: Any) {
       
    }
    
    //물체를 감속도로 이동시키는 메서드
    @objc func move(){
        //한꺼번에 600에 도달하지 말고 조금씩 도달하자 (감속도 공식)
        imgView.frame.origin.x =
            imgView.frame.origin.x +
            0.1*(targetX-imgView.frame.origin.x)
        
        imgView.frame.origin.y =
            imgView.frame.origin.y +
            0.1*(targetY-imgView.frame.origin.y)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         //일정시간 간격으로 호출
               Timer.scheduledTimer(
                   timeInterval: 0.01, target: self, selector: #selector(move), userInfo: nil, repeats: true)
        
        //view내 터치이벤트 구현하기
        let gesture =
            UITapGestureRecognizer(target: self, action: #selector(getPoint))
        self.view.addGestureRecognizer(gesture)
    }
    
    //유저가 화면을 터치하면 targetX,targetY값 대치
    @objc func getPoint(sender:UITapGestureRecognizer){
        let point = sender.location(in: self.view)
        targetX = point.x
        targetY = point.y
    }
    
    
    
}


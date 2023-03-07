//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Hyeji Moon on 2023/01/02.
//

import UIKit

class ViewController: UIViewController {
    
    //Interface Builder outlet : 배출구
    //코드에 대한 내용을 스토리보드로 배출시킴
    
    
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    
    //앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        //viewDidLoad를 재정의 할때는 반드시 super.을 호출하라고 doc 에 명시되어있음. 따라서 그냥 사용해 주면 됨
        super.viewDidLoad()
        
    }
    
    //Interface builder action
    //파라미터 이름을 관습적으로 sender라고함.
    @IBAction func buttonPressed(_ sender: UIButton) {
        //#colorLiteral()
        mainLable.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        mainLable.text = "안녕하세요?"
        
        mainButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
}

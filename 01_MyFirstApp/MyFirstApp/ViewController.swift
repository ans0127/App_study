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
    override func viewDidLoad() {
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

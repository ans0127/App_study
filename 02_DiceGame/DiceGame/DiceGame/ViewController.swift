//
//  ViewController.swift
//  DiceGame
//
//  Created by Hyeji Moon on 2023/01/04.
//

import UIKit

//앱 화면에 들어오면 가장 먼저 실행되는, 처음 진입 시점
class ViewController: UIViewController {
    
    //스토리보드에서 연결한 속성들
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    
    var diceArray : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black5")]
         
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIImageView 의 .image 를 가져와서 사용한 것 뿐임.
        firstDice.image = diceArray[0]
        secondDice.image = diceArray[1]
    }
    
    
    @IBOutlet weak var rollBtn: UIButton!
    
    @IBAction func rollBtnPressed(_ sender: UIButton) {
        //첫번쨰 이미지뷰의 이미지를  랜덤으로 함
        firstDice.image = diceArray.randomElement()   //배열에서 랜덤으로 하나 꺼내서 image에 넣음
        //두번쨰 이미지뷰의 이미지를  랜덤으로 변경
        secondDice.image = diceArray.randomElement()
        
        rollBtn.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
    
    
}


//
//  ViewController.swift
//  DiceGame
//
//  Created by Hyeji Moon on 2023/01/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    
    var diceArray : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black5")]
         
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        firstDice.image = diceArray[0]
        secondDice.image = diceArray[1]
    }
    
    
    @IBOutlet weak var rollBtn: UIButton!
    
    @IBAction func rollBtnPressed(_ sender: UIButton) {
        //첫번쨰 이미지뷰의 이미지를  랜덤으로
        firstDice.image = diceArray.randomElement()
        //두번쨰 이미지뷰의 이미지를  랜덤으로 변경
        secondDice.image = diceArray.randomElement()
        
        rollBtn.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
    
    
}


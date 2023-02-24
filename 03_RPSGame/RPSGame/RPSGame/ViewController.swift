//
//  ViewController.swift
//  RPSGame
//
//  Created by Hyeji Moon on 2023/01/04.
//

import UIKit

class ViewController: UIViewController {
   //변수
    @IBOutlet weak var mainLable: UILabel!
    
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var computerLable: UILabel!
    @IBOutlet weak var myLable: UILabel!

    var comChoice : Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice : Rps = Rps.rock
    
    //함수, 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        //첫번쨰, 두번째 이미지뷰에 준비 이미지를 넣음.
        computerImage.image = #imageLiteral(resourceName: "ready")
        myImage.image = UIImage(named: "ready.png")
        //첫번쨰, 두번째 레이블에 준비 텍스트를 넣음.
        computerLable.text = "ready"
        myLable.text = "ready"
    }
    
    
    
    //함수 하나에 버튼이 3개 연결굄
    @IBAction func rpsBtnPressed(_ sender: UIButton) {
    //가위바위보(enum type으로만든 )를 선택해서 그 정보를 저장해야 함.
//        guard let title = sender.currentTitle else{
//            return
//        }
        
        let title =  sender.currentTitle!
        
        switch title{
            case "가위":
                myChoice = Rps.scissors
            case "바위":
                myChoice = Rps.rock
            case "보":
                myChoice = Rps.paper
            default:
                break
        }
    }
    
    
    
    
    @IBAction func selectBtnPressed(_ sender: UIButton) {
        //컴퓨터가 랜덤 선택한 것을 이미지에 표시
        //컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoice{
        case Rps.rock:
            computerImage.image = #imageLiteral(resourceName: "rock")
            computerLable.text = "rock"

        case Rps.paper:
            computerImage.image = #imageLiteral(resourceName: "paper")
            computerLable.text = "paper"

        case Rps.scissors:
            computerImage.image = #imageLiteral(resourceName: "scissors")
            computerLable.text = "scissors"

        default:
            break
        }
        
        
        //내가 랜덤 선택한 것을 이미지에 표시
        //내가 랜덤 선택한 것을 레이블에 표시
        switch myChoice{
        case Rps.rock:
            myImage.image = #imageLiteral(resourceName: "rock")
            myLable.text = "rock"

        case Rps.paper:
            myImage.image = #imageLiteral(resourceName: "paper")
            myLable.text = "paper"

        case Rps.scissors:
            myImage.image = #imageLiteral(resourceName: "scissors")
            myLable.text = "scissors"

        default:
            break
        }
        
        // 컴퓨터의 선택과 내가 선택한 것을 비교해서 mainLable에 표시
        if comChoice == myChoice{
            mainLable.text = "draw!!"
        }else if comChoice == .rock && myChoice == .paper{
            mainLable.text = "you win"
        }else if comChoice == .paper && myChoice == .scissors {
            mainLable.text = "you win"
        }else if comChoice == .scissors && myChoice == .rock{
            mainLable.text = "you win"
        }else{
            mainLable.text = "you lose"
        }

        
        
        
    }
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        //컴퓨터가 "준비"를 이미지에 표시
        //내가 "준비"를 이미지에 표시

        computerImage.image = #imageLiteral(resourceName: "ready")
        myImage.image = UIImage(named: "ready.png")

        //컴퓨터가 "준비"를 레이블에 표시
        //내가 "준비"를 레이블에 표시
        computerLable.text = "ready"
        myLable.text = "ready"
        
        //메인 레이블에 select me!를 표시
        mainLable.text = "select me!~~"
        //컴퓨터가 다시 렌덤 가위바위보를 선택하고 저장
        
        var comChoice : Rps = Rps(rawValue: Int.random(in: 0...2))!
        var myChoice : Rps = Rps.rock
    }
    
}

//
//enum RPS{
//    case rock
//    case paper
//    case scissors
//}

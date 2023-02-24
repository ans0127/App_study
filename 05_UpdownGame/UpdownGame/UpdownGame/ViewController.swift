//
//  ViewController.swift
//  UpdownGame
//
//  Created by Hyeji Moon on 2023/01/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var numLable: UILabel!
    
    //컴퓨터가 렌덤 숫자 선택
    var comNumber = Int.random(in: 1...10)
    //내가 선택한 숫자
    var mySelectedNumber = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. 메인레이블에 select number 라고 표시
        mainLable.text = "Select Number Pleas!!"
        //2. 숫자 레이블은 아무표시 안함 -> "" 공백표시
        numLable.text = " "
    }
    
    
    //숫자버튼 눌렀을 때
    @IBAction func btnPressed(_ sender: UIButton) {
        //1. 버튼의 숫자를 가져와야 함.
        //currentTitle 은 optional string 타입임.
        // var num = sender.currentTitle! 과 같음.
        guard let numString = sender.currentTitle else { return }
        
        //2. 숫자 레이블이 변하도록
        numLable.text = numString  //String임
        
        //3. 선택한 숫자를 변수에 저장.(선택사항)
        guard let num = Int(numString) else {return}  //string -> int
        mySelectedNumber = num   //저장.
    }
    

    @IBAction func selectBtnPressed(_ sender: UIButton) {
        
        //  <<<3.선택한 숫자를 변수에 저장하지 않고 바로 사용하는 또다른 방법 >>>>
        //레이블의 스트링 가져옴.
//        guard let mynumLableString = numLable.text else {return}
        // 스트링 ->int
//        guard let mynum = Int(mynumLableString) else { return }
        
        
        // 컴퓨터의 렌덤숫자와 내가 선택한 숫자를 비교해서 up. down. bingo 확인해서 출력
        if(mySelectedNumber > comNumber){
            mainLable.text = "down"
        }else if( mySelectedNumber < comNumber){
            mainLable.text = "up"
        }else{
            mainLable.text = "✨ bingo ✨"
        }
    }
    
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        //메인레이블 : select me
        mainLable.text = "Select Number Pleas!!"
        //컴퓨터가 다시 렌덤 숫자 선택
        comNumber = Int.random(in: 1...10)
        //숫자레이블에 공백 표시
        numLable.text = " "
    }
}












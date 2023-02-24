//
//  main.swift
//  RandomBingo
//
//  Created by Hyeji Moon on 2023/01/05.
//

import Foundation

print("숫자만 입력해주세요")

//내가 콘솔에 입력하면 컴퓨터가 읽어오는 함수
//let a = readLine()!
//print(a)

    
    
    
    var comChoice = Int.random(in: 1...100)
    
    var myChoice = 0

while true{
    var userInput = readLine()
    
    if let input = userInput{  //optional string -> string
        if let num = Int(input){  // string -> optional int  & optional int -> int (using if let)
            myChoice = num
        }
    }


    
    if comChoice > myChoice {
        print("up")
    }else if comChoice < myChoice {
        print("down")
    }else{
        print("bingo!!!")
        break //반복문을 종료.
    }
}
//for문은 반복의 횟수가 정해져 있을 때 사용하기 때문에
//while문을 사용

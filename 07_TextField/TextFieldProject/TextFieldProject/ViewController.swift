//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Hyeji Moon on 2023/03/07.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        textField.delegate = self
    }

    func setup(){
        
        view.backgroundColor = UIColor.gray
        textField.keyboardType =  UIKeyboardType.emailAddress
        textField.placeholder = "your email"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        //UIWindow = 화면 객체 : 입력을 받아들이는 객체
        
        //textField를 첫번째로 반응하도록 지정해줌 = 키보드 바로 올라오게 해줌
        textField.becomeFirstResponder()
    }
    
    //화면의 탭을 감지하는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //textField.resignFirstResponder() 와 같은 코드
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        if textField.text == ""{
            textField.placeholder = "please type something"
            return false
        }else{
            return true
        }
    }
    
    
    
    //자주사용!! 입력할 때마다 이 함수를 실행해서 string을 출력함
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(string)
//        return true
        //텍스트를 10글자 제한하는 코드
        let maxLength = 10
           let currentString: NSString = (textField.text ?? "") as NSString
           let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString

           return newString.length <= maxLength
    }
    
    
    
        //텍스트필드의 입력이 끝날 때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    
    
    //텍스트필드를 clear 할지 말지
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    

    @IBAction func doneBtnTapped(_ sender: UIButton) {
        textField.resignFirstResponder() //키보드 내려가도록 설정
    }
    
    
    
}


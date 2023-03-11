//
//  ViewController.swift
//  Login
//
//  Created by Hyeji Moon on 2023/03/07.
//
/*  스토리보드를 사용하지 않고 앱 만들기
 1. 뷰를 지정해준다.
 emailTextFieldView 정해주고
                    ->  뷰의 레이블(emailInfoLabel)인 ' 이메일 또는 전화번호' 지정
                    -> 그 위에 텍스트 올릴 수 있도록 텍스트필드올리기(emailTextField) <subViw로 묶음>
 passwordTextFieldView 정해주고
                    -> 뷰의 레이블 (passwordInfoLabel) '비밀번호' 지정
                    -> 그 위에 텍스트 올릴 수 있도록 텍스트필드올리기 (passwordTextField) , passwordSecureButton 까지 <subViw로 묶음>
 loginButton 생성
 2. 뷰 3개를 stackView로 묶음
 => emailTextFieldView, passwordTextFieldView, loginButton 을 stackView 하나로 묶음
 3. 비밀번호 재설정 추가
 
 
 ***  addTarget  = selector  를 사용해서 다른 함수와 연결해주는 것
 
 
 UITextFieldDelegate 프로토콜을 채택해서 사용,
 extension ViewController : UITextFieldDelegate 를 사용할 때는 viewDidLoad 에 'self'설정을 해주어야 한다.
 
 
 오토레이아웃 기능을 사용할 경우
 오토레이아웃을 동적으로 바꾸는 코드를 추가해준다.
 */

import UIKit

class ViewController: UIViewController {

    //메모리에 올림.(화면에 표시는 안됨)
    //let emailTextFieldView = UIView()
    
    //클로저의 실행문 상태로 속성을 생성
    //이메일 입력하는 텍스트 뷰
    private lazy var  emailTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        //회색 view 위에 UILabel, UITextField를 올림 -- emailTextFieldView > emailTextField -> emailInfoLabel 순으로 올라가도록 한다.
        view.addSubview(emailTextField)  //view 위에 text, label 을 올려준다.
        view.addSubview(emailInfoLabel)
        
        return view
    }()
    
    
    //"이메일 또는 전화번호" 안내문구
    private var emailInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    //이메일 입력 필드
    private lazy var emailTextField : UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)  //editingchanged : 값이 변할 떄 마다
        
        return tf
    }()
    
    
    //비밀번호 입력하는 텍스트 뷰
    private lazy var passwordTextFieldView : UIView = {
       let view = UIView()
        view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        
        return view
    }()
    
    //패스워드텍스트필드의 안내문구
    private var passwordInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        
        return label
    }()
    
    //비밀번호 입력 필드
    private let passwordTextField : UITextField = {
       let tf = UITextField()
        tf.backgroundColor = UIColor.black
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true  // 비밀번호 가려주는 설정
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return tf
    }()
    
    //비밀번호의 오른쪽 끝 "표시" 버튼
    private let passwordSecureButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(UIColor.white , for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        
        return button
    }()
    
    //로그인버튼
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1        //버튼의 선   borderWidth borderColor 는 세트로 같이 작성해주어야 한다.
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)        //버튼의 선
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false  //버튼비활성화
        
        return button
    }()
    
    //스택 뷰 생성
    lazy var stackView : UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        st.spacing = 18 //스텍뷰의 스페이스(간격)
        st.axis = .vertical  //축 ( 세로로 정렬된 것을 묶을 것인지, 가로로정렬된 것을 묶을 것인지(
        st.distribution = .fillEqually //분배를 어떻게 할 것인지 - 높이 간격은 동일하니까 동일하게,
        st.alignment = .fill
        
        return st
    }()
    
    //비밀번호 재설정 버튼
    private let passwordResetButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        //addTarget  = selector  를 사용해서 다른 함수와 연결해주는 것
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    
    //각 텍스트필드1, 텍스트필드2, 로그인 버튼의 높이 설정
    private let textViewHeight : CGFloat = 48

    //오토레이아웃을 담을 수 있는 변수 선언 -- 오토레이아웃: 글씨크기를 작게 만들기 위한 기능
    lazy var emailInfoLabelcenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelcenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

   
    
    func makeUI(){
        //view = viewController의 기본 뷰 -- 가장 바탕이 되는 view 위에 stackview를 올림
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        view.backgroundColor = UIColor.black
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        //emailTextFieldView 위에 있는 로그인 시 이메일 입력하는 text label 의 ui 설정
        ///emailTextFieldView 위에 있는 로그인 시 이메일 입력하는 text label 의 ui 설정 ========방법 1.
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
//            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
            emailInfoLabelcenterYConstraint,
            
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2),
            
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: 8),
//            passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            passwordInfoLabelcenterYConstraint,
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),   //textview 의 높이 설정
            
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
            
        ])
        
        
        //코드로 앱을 만들 때 코드가 자동으로 오토레이아웃을 잡혀주는 것을 끄는 기능 ⭐️
        //        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        //        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30 ).isActive = true     //왼쪽에서 얼마나 띌 건지를  의미
        //        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true     //오른쪽에서 얼마나 띌 건지를 의미
        //        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true    //위쪽
        //        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true  //높이
        
        //emailTextFieldView 위에 있는 로그인 시 이메일 입력하는 text label 의 ui 설정==========방법2.
        //        emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8).isActive = true //왼쪽
        //        emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8).isActive = true //오른쪽
        //        emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor).isActive = true //y축 가운데 정렬
        
        //실제 텍스트 필드에 대한 오토레이아웃 작성 =========== 방법2.
        //        emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8).isActive = true
        //        emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8).isActive = true
        //        emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15).isActive = true
        //        emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2).isActive = true
    }
    
    
    
    
    //selector 로 만들었기 때문에 objc 를 붙여줌
    @objc func resetButtonTapped(){
//        print("리셋버튼이 눌렸습니다.")
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까? ", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default){ action in
            print( "확인 !")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소 !")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        present(alert, animated:  true, completion:  nil)
    }
    
    //표시버튼 클릭시 마스킹 없이 비밀번호를 보는 기능
    @objc func passwordSecureModeSetting(){
        passwordTextField.isSecureTextEntry.toggle()
        print("표시버튼 클릭")
    }
}

extension ViewController : UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            emailInfoLabelcenterYConstraint.constant = -13  //오토레이아웃을 동적으로 만들어주는 코드 13만큼 위로 올라감
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            passwordInfoLabelcenterYConstraint.constant = -13
        }
        
        //오토레이아웃이 동적으로 조정되게 한 다음 애니메이션 효과 주기
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded() // 에니메이션이 0.3초동안 자연스럽게 runloop 가 일어나도록 하는 코드
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            //빈칸이면 원래대로 되돌리기
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                emailInfoLabelcenterYConstraint.constant = 0
            }
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            if passwordTextField.text == "" {
                passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
                passwordInfoLabelcenterYConstraint.constant = 0
            }
        }
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded() // 에니메이션이 0.3초동안 자연스럽게 runloop 가 일어나도록 하는 코드
        }
    }
    
    
    //email. pw 모두 글자가 있으면 버튼을 빨간색으로 변화
    @objc func textFieldEditingChanged(_ textField: UITextField){
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
            textField.text == ""
            return
        }
    }
    guard
    let email = emailTextField.text, !email.isEmpty,
    let password = passwordTextField.text, !password.isEmpty else {
        loginButton.backgroundColor = .clear
        loginButton.isEnabled = false
        return
    }
    loginButton.backgroundColor = .red
    loginButton.isEnabled = true
}
    
    //delegate 프로토콜 사용 :: 텍스트 필드에 한글자 입력할때마다 불려지는 함수
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            //로그인 버튼 빨간색으로 만들기
    //    }
}



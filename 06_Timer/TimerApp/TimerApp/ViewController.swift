//
//  ViewController.swift
//  TimerApp
//
//  Created by Hyeji Moon on 2023/02/27.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    //reset을 누르면 sliderbtn 이 이동하도록, slider를 멤버로 선언
    @IBOutlet weak var slider: UISlider!
    //timer 는 class 이고 class의 인스턴스는 힙에 저장이 되니까 weak으로 선언함.
    weak var timer: Timer?
    
    var number = 0
    
    
    //앱 화면 들어왔을 때의 처음 진입점
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        //mainLable에 대해 셋팅
        mainLabel.text = "초를 선택하세요"
        
        //slider의 가운데 설정 - developer doc 에서 ui slider에 대해 읽어보자!
        slider.value = 0.5
//        slider.setValue(0.5, animated: true)

    }

    //event : valueChanged = 값이 바뀔 때마다
    @IBAction func sliderChanged(_ sender: UISlider) {
        //slider value 값이 바뀔 때마다 label text 셋팅
        
        let seconds = Int(slider.value * 60)//0.0- 1.0
//            print(seconds)
        mainLabel.text = "\(seconds) 초"
        number = seconds
    }
    
    
    @IBAction func startBtnTapped(_ sender: UIButton) {
        //1초씩 지나갈때마다 무언가를 실행
        mainLabel.text = "start btn clicked"
        timer?.invalidate()//타이머가 중복되어 실행되지 않도록 함
        //여기서 self는 viewController임.
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
                //반복하고 싶은 코드 작성
                if number > 0 {
                    number -= 1//숫자를 1씩 줄임 (레이블.슬라이더도)
                    slider.value = Float(number) / Float(60) // value = 0~ 1 사이의 값만 들어갈수있음 ..숫자 계산해서 넣기
                    mainLabel.text = "\(number) 초"
                }else{
                    number = 0
                    mainLabel.text = "초를 선택하세요"
                    timer?.invalidate() //stop timer
                    
                    //number 가 0 일 때 소리가 나도록 함.
                    AudioServicesPlayAlertSound(SystemSoundID(1322))
                    
                }
            }
    }
    
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        timer?.invalidate()
        number = 0
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
    }
    
}


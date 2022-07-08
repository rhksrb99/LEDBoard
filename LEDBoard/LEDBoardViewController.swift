//
//  BoardViewController.swift
//  LEDBoard
//
//  Created by 박관규 on 2022/07/06.
//

import UIKit

// return 키 클릭 시 키보드를 숨기는 함수를 사용하기위해 UITextFieldDelegate를 상속받는다.
class BoardViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tf_input: UITextField!
    @IBOutlet weak var btn_sendtext: UIButton!
    @IBOutlet weak var btn_changeColor: UIButton!
    @IBOutlet weak var lb_board: UILabel!
    
    @IBOutlet weak var view_input: UIView!
    @IBOutlet var btn_list: [UIButton]!
    
    var colorArray: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        designLabel()
        designButton(btn_sendtext, buttonTitle: "전송", buttonHighlightedTitle: "보내기~", bgColor: .white, titleColor: .red)
        designButton(btn_changeColor, buttonTitle: "색변경", buttonHighlightedTitle: "바꾸기~", bgColor: .lightGray, titleColor: .green)
        designTextField()
        
        // return키 클릭 시 키보드를 숨기기 위해 필요한 작성구문.
        self.tf_input.delegate = self
        
    }

    
    
    // MARK: - Function
    
    // 함수 호출 연산자 -> ()
    func designTextField() {
        tf_input.placeholder = "내용을 입력하세요~!"
        tf_input.keyboardType = .emailAddress
        tf_input.keyboardType = .emailAddress
        tf_input.font = .systemFont(ofSize: 15)
        tf_input.borderStyle = .none
        tf_input.textColor = .black
    }
    
    // buttonOutletVariableName : 외부 매개변수 Argument Label, viewDidLoad에서 호출 시 사용 -> 생략가능
    // buttonName : 내부 매개변수 Parameter Name
    // _ : 와일드 카드 식별자
    func designButton(_ buttonName: UIButton,buttonTitle: String, buttonHighlightedTitle: String,bgColor: UIColor,titleColor: UIColor){
        // normal -> 기본적인 적용 상태
        // highlighted -> 클릭이 되었을 때의 적용 상태
        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setTitle(buttonHighlightedTitle, for: .highlighted)
        buttonName.backgroundColor = bgColor
        buttonName.layer.cornerRadius = 5
        buttonName.layer.borderWidth = 1
        buttonName.layer.borderColor = UIColor.darkGray.cgColor
        buttonName.setTitleColor(titleColor, for: .normal)
        buttonName.setTitleColor(titleColor, for: .highlighted)
    }
    
    func designLabel(){
        // 레이블 속 값에 대한 줄바꿈
        lb_board.numberOfLines = 0
        // Storyboard상의 default 색상 -> code로 작성할 땐 clear
        lb_board.backgroundColor = .clear
    }
    
    // return키 클릭 시 키보드 숨기기
    // UITextFieldDelegate return key 이벤트 함수
    func textFieldShouldReturn(_ textField:UITextField) -> Bool{

        if textField == self.tf_input{
            tf_input.resignFirstResponder()
        }
        return true
    }
    
    func outletCollection(){
//        // 코드의 간소화
//        // 1. 반복문
//        let buttonArray: [UIButton] = [btn_sendtext, btn_changeColor]
//
//        for item in buttonArray {
//
//            item.backgroundColor = .blue
//            item.layer.cornerRadius = 2
//            item.layer.borderWidth = 1
//
//        }
//
//        // 2. Outlet Collection으로 연결하기 (Outlet 연결을 배열로 선언)
//        for item in btn_list {
//
//            item.backgroundColor = .blue
//            item.layer.cornerRadius = 2
//            item.layer.borderWidth = 1
//
//        }
    }
    
    // MARK: - IBActions
    
    @IBAction func btn_send(_ sender: UIButton) {
        lb_board.text = tf_input.text
    }
    
    @IBAction func btn_chageTextColor(_ sender: UIButton) {
        lb_board.textColor = colorArray.randomElement()
    }
    
    // 키보드를 내릴 때 가장 쉽게 처리 할 수 있는 방법
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        view_input!.isHidden = true
        
    }
    
    // TextField 입력 중 혹은 입력이 끝난 후 return 키를 누르면 키보드가 사라짐
//    @IBAction func didEndOnExit(_ sender: UITextField) {
//    }
    
    
    // 한가지의 액션함수로 같은 타입이라면 여러개에 적용할 수 있다.
//    @IBAction func testButton(_ sender: UIButton) {
//        view.endEditing(true)
//    }
    
    // 연결관계를 다 끊고 Any로 새롭게 연결해보기
    @IBAction func keyBoardDismiss(_ sender: Any){
        view.endEditing(true)
    }
    
    
}

//
//  SurveySexViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/10/27.
//

import Foundation
import UIKit

class SurveySexViewController: UIViewController {
    
    var sex : String = ""
    
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0 // 초기 프로그레스 25%
        return progressView
    }()
    
    private let mainAgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "성별을 선택해주세요"
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionAgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(r: 113, g: 114, b: 122)
        label.textAlignment = .left
        label.text = "성별에 경우,모델학습에 도움이 됩니다."
        label.numberOfLines = 1
        return label
    }()
    
    private let manButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("남자", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.setTitleColor(UIColor.black, for: .normal) // 텍스트 색상을 검은색으로 변경
        button.backgroundColor = UIColor.white // 배경색을 하얀색으로 변경
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        // 텍스트 왼쪽 정렬 설정
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        // 테두리 설정
        button.layer.borderColor = UIColor(r: 197, g: 198, b: 204).cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let check_man: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "check")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private let womanButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("여자", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.setTitleColor(UIColor.black, for: .normal) // 텍스트 색상을 검은색으로 변경
        button.backgroundColor = UIColor.white // 배경색을 하얀색으로 변경
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        // 텍스트 왼쪽 정렬 설정
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        // 테두리 설정
        button.layer.borderColor = UIColor(r: 197, g: 198, b: 204).cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let check_woman: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "check")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private let mainYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "생년월일을 선택해주세요"
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(r: 113, g: 114, b: 122)
        label.textAlignment = .left
        label.text = "생년월일에 경우,모델학습에 도움이 됩니다."
        label.numberOfLines = 1
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(r: 0, g: 111, b: 253)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KR") // 원하는 로케일로 설정
        datePicker.maximumDate = Date() // 미래 날짜 선택 방지
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 현재 뷰 컨트롤러의 뒤로가기 버튼을 숨깁니다.
        self.navigationItem.hidesBackButton = true
        
        // 홈 버튼을 생성하고 액션을 추가
        let homeImage = UIImage(systemName: "house.fill") // 시스템 이미지 이름을 변경해야 할 수 있음
        let homeButton = UIBarButtonItem(image: homeImage, style: .plain, target: self, action: #selector(goToHome))
        self.navigationItem.rightBarButtonItem = homeButton
        
        self.view.addSubview(progressBar)
        self.view.addSubview(mainAgeLabel)
        self.view.addSubview(descriptionAgeLabel)
        self.view.addSubview(manButton)
        self.view.addSubview(check_man)
        self.view.addSubview(womanButton)
        self.view.addSubview(check_woman)
        self.view.addSubview(nextButton)
        self.view.addSubview(datePicker)
        self.view.addSubview(mainYearLabel)
        self.view.addSubview(descriptionYearLabel)
        
        
        progressBar.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(34)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(40) // 프로그레스바의 상단을 조절
            make.height.equalTo(10) // 프로그레스바 높이 설정
        }
        
        mainAgeLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.top.equalTo(self.progressBar.snp.bottom).offset(40)
        }
        descriptionAgeLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.top.equalTo(self.mainAgeLabel.snp.bottom).offset(10)
        }
        manButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(34)
            make.top.equalTo(self.descriptionAgeLabel.snp.bottom).offset(33)
            make.height.equalTo(50)
        }
        check_man.snp.makeConstraints { make in
            make.trailing.equalTo(self.manButton.snp.trailing).inset(34)
            make.top.equalTo(self.manButton.snp.top).offset(16)
            make.height.equalTo(15)
            make.width.equalTo(15)
        }
        womanButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(34)
            make.top.equalTo(self.manButton.snp.bottom).offset(26)
            make.height.equalTo(50)
        }
        check_woman.snp.makeConstraints { make in
            make.trailing.equalTo(self.womanButton.snp.trailing).inset(34)
            make.top.equalTo(self.womanButton.snp.top).offset(16)
            make.height.equalTo(15)
            make.width.equalTo(15)
        }
        mainYearLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.top.equalTo(self.womanButton.snp.bottom).offset(60)
        }
        descriptionYearLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.top.equalTo(self.mainYearLabel.snp.bottom).offset(10)
        }
        datePicker.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.top.equalTo(self.descriptionYearLabel.snp.bottom).offset(30)
        }
        self.nextButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(50)
            make.height.equalTo(48)
        }
        
        manButton.addTarget(self, action: #selector(manButtonTapped), for: .touchUpInside)
        womanButton.addTarget(self, action: #selector(womanButtonTapped), for: .touchUpInside)
        self.nextButton.addTarget(self, action: #selector(onPressNextButton), for: .touchUpInside)
        
        // 날짜 선택 시 동작을 추가
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    // manButton을 클릭했을 때 호출될 메서드
    @objc private func manButtonTapped() {
        // 버튼의 배경색을 파란색으로 변경
        manButton.backgroundColor = UIColor(r: 234, g: 243, b: 255)
        // 다른 버튼의 배경색을 원래대로 되돌리고 싶다면 아래와 같이 처리할 수 있습니다.
        womanButton.backgroundColor = UIColor.white
        check_man.isHidden = false
        check_woman.isHidden = true
        sex = "남자"
        progressBar.setProgress(0.33, animated: true)
    }
    // manButton을 클릭했을 때 호출될 메서드
    @objc private func womanButtonTapped() {
        // 버튼의 배경색을 파란색으로 변경
        womanButton.backgroundColor = UIColor(r: 234, g: 243, b: 255)
        // 다른 버튼의 배경색을 원래대로 되돌리고 싶다면 아래와 같이 처리할 수 있습니다.
        manButton.backgroundColor = UIColor.white
        check_man.isHidden = true
        check_woman.isHidden = false
        sex = "여자"
        progressBar.setProgress(0.33, animated: true)
    }

    @objc func onPressNextButton(sender: UIButton) {
        let surveyView_2 = SurveySkinViewController()
        self.navigationController?.pushViewController(surveyView_2, animated: true)
    }
    
    // DatePicker 값이 변경될 때 호출될 메서드
    @objc private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // 적절한 형식으로 설정
        let selectedDate = dateFormatter.string(from: datePicker.date)
        print("Selected Date: \(selectedDate)")
        progressBar.setProgress(0.33, animated: true)
    }
    
    @objc func goToHome() {
        // 홈 버튼을 눌렀을 때 실행할 코드를 작성
        // 예를 들어, 다른 뷰 컨트롤러로 이동하는 코드를 여기에 추가
         let homeViewController = MainViewController()
         self.navigationController?.pushViewController(homeViewController, animated: false)
    }
}

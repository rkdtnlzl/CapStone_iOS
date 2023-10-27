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
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "성별을 선택해주세요"
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(r: 113, g: 114, b: 122)
        label.textAlignment = .left
        label.text = "성별에 경우, 모델의 성별을 학습할때 도움이 됩니다."
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 현재 뷰 컨트롤러의 뒤로가기 버튼을 숨깁니다.
        self.navigationItem.hidesBackButton = true
        
        self.view.addSubview(progressBar)
        self.view.addSubview(mainLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(manButton)
        self.view.addSubview(check_man)
        self.view.addSubview(womanButton)
        self.view.addSubview(check_woman)
        self.view.addSubview(nextButton)
        
        
        progressBar.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(34)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(40) // 프로그레스바의 상단을 조절
            make.height.equalTo(10) // 프로그레스바 높이 설정
        }
        
        mainLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.top.equalTo(self.progressBar.snp.bottom).offset(40)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.top.equalTo(self.mainLabel.snp.bottom).offset(10)
        }
        manButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(34)
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(63)
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
        self.nextButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(50)
            make.height.equalTo(48)
        }
        
        manButton.addTarget(self, action: #selector(manButtonTapped), for: .touchUpInside)
        womanButton.addTarget(self, action: #selector(womanButtonTapped), for: .touchUpInside)
        // 로그인하기 버튼 클릭시 다음화면으로 이동
//        self.nextButton.addTarget(self, action: #selector(onPressNextButton), for: .touchUpInside)
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
        progressBar.setProgress(0.25, animated: true)
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
        progressBar.setProgress(0.25, animated: true)
    }

//    @objc func onPressNextButton(sender: UIButton) {
//        let surveyView_2 = SurveyTopColorViewController()
//        UserDefaults.standard.set(self.sex, forKey: "sex")
//        let sex:String = UserDefaults.standard.object(forKey: "sex") as! String
//        print(sex)
//        self.navigationController?.pushViewController(surveyView_2, animated: true)
//    }
}

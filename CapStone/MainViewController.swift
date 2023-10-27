//
//  MainViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/09/11.
//

import Foundation
import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let blueView : UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(r: 234, g: 242, b: 255)
            return view
        }()
        
        private let mainLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            label.textColor = .black
            label.textAlignment = .left
            label.text = "자신의 피부를 진단해보세요"
            label.numberOfLines = 1
            return label
        }()
        
        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            label.textColor = UIColor(r: 113, g: 114, b: 122)
            label.textAlignment = .left
            label.text = "인공지능 학습을 통해 피부질환을 분석해드립니다. 또한 가까운 병원도 알려드립니다."
            label.numberOfLines = 2
            return label
        }()
        
        private let nextButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("시작하기", for: .normal)
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
            
            self.view.addSubview(blueView)
            self.view.addSubview(mainLabel)
            self.view.addSubview(descriptionLabel)
            self.view.addSubview(nextButton)
            
            self.blueView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(250)
            }
            
            self.mainLabel.snp.makeConstraints { make in
                make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(25)
                make.top.equalTo(self.blueView.snp.bottom).offset(40)
            }
            
            self.descriptionLabel.snp.makeConstraints { make in
                make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(25)
                make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(25)
                make.top.equalTo(self.mainLabel.snp.bottom).offset(25)
            }
            
            self.nextButton.snp.makeConstraints { make in
                make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
                make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
                make.top.equalTo(self.descriptionLabel.snp.bottom).offset(24)
                make.height.equalTo(48)
            }
            // 버튼 클릭시 다음화면으로 이동
            self.nextButton.addTarget(self, action: #selector(onPressNextButton), for: .touchUpInside)
        }
        
        @objc func onPressNextButton(sender: UIButton) {
            let surveyView_1 = SurveySexViewController()
            self.navigationController?.pushViewController(surveyView_1, animated: true)
        }
}

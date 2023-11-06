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
    
    private let surveyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("피부 질환 진단", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        return button
    }()
    
    private let nearHospitalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가까운 병원", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let recommendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("추천 약품", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("질병 리스트", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let myPageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("마이페이지", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 220, g: 234, b: 255)
        
        // 현재 뷰 컨트롤러의 뒤로가기 버튼을 숨깁니다.
        self.navigationItem.hidesBackButton = true
        
        
        self.view.addSubview(surveyButton)
        self.view.addSubview(nearHospitalButton)
        self.view.addSubview(recommendButton)
        self.view.addSubview(listButton)
        self.view.addSubview(myPageButton)
        
        
        self.surveyButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(60)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(450)
        }
        
        self.nearHospitalButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(200)
            make.top.equalTo(self.surveyButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(260)
        }
        
        self.recommendButton.snp.makeConstraints { make in
            make.leading.equalTo(self.nearHospitalButton.snp.trailing).offset(20)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.surveyButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(260)
        }
        
        self.listButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(200)
            make.top.equalTo(self.nearHospitalButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(80)
        }
        
        self.myPageButton.snp.makeConstraints { make in
            make.leading.equalTo(self.listButton.snp.trailing).offset(20)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.recommendButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(80)
        }
        
        // 버튼 클릭시 다음화면으로 이동
        self.surveyButton.addTarget(self, action: #selector(onPressNextButton), for: .touchUpInside)
    }
    
    @objc func onPressNextButton(sender: UIButton) {
        let surveyView_1 = SurveySexViewController()
        self.navigationController?.pushViewController(surveyView_1, animated: true)
    }
}

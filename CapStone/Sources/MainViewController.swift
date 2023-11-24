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
    
    let mainCustomView_1 = MainCustomView_1()
    let nearHospitalView = MainCustomView_2()
    let recommendView = MainCustomView_2()
    let listView = MainCustomView_2()
    let mypageView = MainCustomView_2()
    
    private let surveyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("피부 질환 진단", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        return button
    }()
    
    private let nearHospitalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("가까운 병원", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let recommendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("추천 약품", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("질병 리스트", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let myPageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("마이페이지", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 220, g: 234, b: 255)
        
        // 현재 뷰 컨트롤러의 뒤로가기 버튼을 숨깁니다.
        self.navigationItem.hidesBackButton = true
        
        mainCustomView_1.imageView.image = UIImage(named: "camera")
        mainCustomView_1.nameLabel.text = "피부 질환 진단"
        
        nearHospitalView.imageView.image = UIImage(named: "hospital")
        nearHospitalView.nameLabel.text = "가까운 병원"
        
        recommendView.imageView.image = UIImage(named: "medicine")
        recommendView.nameLabel.text = "추천 약품"
        
        listView.imageView.image = UIImage(named: "list")
        listView.nameLabel.text = "질병 리스트"
        
        mypageView.imageView.image = UIImage(named: "mypage")
        mypageView.nameLabel.text = "마이페이지"
        
        
        self.view.addSubview(mainCustomView_1)
        self.view.addSubview(nearHospitalView)
        self.view.addSubview(recommendView)
        self.view.addSubview(listView)
        self.view.addSubview(mypageView)
        self.view.addSubview(surveyButton)
        self.view.addSubview(nearHospitalButton)
        self.view.addSubview(recommendButton)
        self.view.addSubview(listButton)
        self.view.addSubview(myPageButton)
        
        self.mainCustomView_1.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(60)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(450)
        }
        self.surveyButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(60)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(450)
        }
        
        self.nearHospitalView.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(200)
            make.top.equalTo(self.surveyButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(260)
        }
        
        self.nearHospitalButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(200)
            make.top.equalTo(self.surveyButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(260)
        }
        
        self.recommendView.snp.makeConstraints { make in
            make.leading.equalTo(self.nearHospitalButton.snp.trailing).offset(20)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.surveyButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(260)
        }
        
        self.recommendButton.snp.makeConstraints { make in
            make.leading.equalTo(self.nearHospitalButton.snp.trailing).offset(20)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.surveyButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(260)
        }
        
        self.listView.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(200)
            make.top.equalTo(self.nearHospitalButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(80)
        }
        
        self.listButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(200)
            make.top.equalTo(self.nearHospitalButton.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(80)
        }
        
        self.mypageView.snp.makeConstraints { make in
            make.leading.equalTo(self.listButton.snp.trailing).offset(20)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.recommendButton.snp.bottom).offset(20)
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
        self.nearHospitalButton.addTarget(self, action: #selector(onPressNearHospitalButton), for: .touchUpInside)
    }
    
    @objc func onPressNextButton(sender: UIButton) {
        let surveyView_1 = SurveySexViewController()
        self.navigationController?.pushViewController(surveyView_1, animated: true)
    }
    
    @objc func onPressNearHospitalButton(sender: UIButton) {
        let hospitalView_1 = NearHospitalViewController()
        self.navigationController?.pushViewController(hospitalView_1, animated: true)
    }
}


class MainCustomView_1: UIView{
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //code
        ab()
        setupLayout()
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func ab(){
        print("Init")
    }
    func setupLayout() {
        backgroundColor = .white
        addSubview(imageView)
        addSubview(nameLabel)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(45)
            make.centerX.equalToSuperview()
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(15)
        }
    }
}


class MainCustomView_2: UIView{
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //code
        ab()
        setupLayout()
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func ab(){
        print("Init")
    }
    func setupLayout() {
        backgroundColor = .white
        addSubview(imageView)
        addSubview(nameLabel)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(35)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(15)
        }
    }
}

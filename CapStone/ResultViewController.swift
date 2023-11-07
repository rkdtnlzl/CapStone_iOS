//
//  ResultViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/11/06.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    let firstDoubtView = CustomView()
    
    private let firstDoubtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "1순위 의심 질환"
        label.numberOfLines = 1
        return label
    }()
    
    private let hospitalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "의심 질환 병원 TOP3"
        label.numberOfLines = 1
        return label
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
        
        
        
        firstDoubtView.imageView.image = UIImage(named: "acne")
        firstDoubtView.nameLabel.text = "여드름"
        firstDoubtView.descriptionLabel.text = "남녀의 얼굴·가슴 등에 도톨도톨하게 나는 작은 종기"
        
        self.view.addSubview(firstDoubtLabel)
        self.view.addSubview(firstDoubtView)
        self.view.addSubview(hospitalLabel)
        
        firstDoubtLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(36)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(20)
        }
        
        firstDoubtView.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(34)
            make.top.equalTo(self.firstDoubtLabel.snp.bottom).offset(12)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(320)
        }
        
        hospitalLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(36)
            make.top.equalTo(self.firstDoubtView.snp.bottom).offset(30)
        }
    }
    
    @objc func goToHome() {
        // 홈 버튼을 눌렀을 때 실행할 코드를 작성
        // 예를 들어, 다른 뷰 컨트롤러로 이동하는 코드를 여기에 추가
        let homeViewController = MainViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}


class CustomView: UIView{
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "acne")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    let moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("더 알아보기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor(r: 0, g: 111, b: 254), for: .normal)
        
        // 배경색을 투명하게 설정
        button.backgroundColor = .clear
        
        // 테두리 색상 및 두께 설정
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(r: 0, g: 111, b: 254).cgColor
        
        button.clipsToBounds = true
        return button
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
        backgroundColor = UIColor(r: 248, g: 248, b: 254)
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(moreButton)
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).inset(0)
            make.trailing.equalTo(snp.trailing).inset(0)
            make.top.equalTo(snp.top).inset(0)
            make.height.equalTo(210)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).inset(15)
            make.top.equalTo(imageView.snp.bottom).offset(15)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).inset(15)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        moreButton.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).inset(14)
            make.trailing.equalTo(snp.trailing).inset(14)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(14)
            make.height.equalTo(40)
        }
    }
}

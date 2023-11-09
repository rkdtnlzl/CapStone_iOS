//
//  DetailDiseaseViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/11/09.
//

import Foundation
import UIKit

class DetailDiseaseViewController: UIViewController {
    
    private let diseaseImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "acne_1")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "여드름"
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "남녀의 얼굴·가슴 등에 도톨도톨하게 나는 작은 종기"
        label.numberOfLines = 1
        return label
    }()
    
    private let detailLabel_1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "- 털을 만드는 모낭에 붙어있는 피지선에 발생"
        label.numberOfLines = 1
        return label
    }()
    
    private let detailLabel_2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "- 후유증으로 오목한 흉터 또는 확대된 흉터"
        label.numberOfLines = 1
        return label
    }()
    
    private let detailLabel_3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "- 보통 여드름은 주로 사춘기에 발생"
        label.numberOfLines = 1
        return label
    }()
    
    private let detailLabel_4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "- 처음에는 붉은 기가 돌다가 갈색으로 변하게 된다"
        label.numberOfLines = 1
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.view.addSubview(diseaseImage)
        self.view.addSubview(nameLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(detailLabel_1)
        self.view.addSubview(detailLabel_2)
        self.view.addSubview(detailLabel_3)
        self.view.addSubview(detailLabel_4)
        
        diseaseImage.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(320)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).inset(25)
            make.top.equalTo(self.diseaseImage.snp.bottom).offset(34)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).inset(25)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(8)
        }
        detailLabel_1.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).inset(25)
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(45)
        }
        detailLabel_2.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).inset(25)
            make.top.equalTo(self.detailLabel_1.snp.bottom).offset(5)
        }
        detailLabel_3.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).inset(25)
            make.top.equalTo(self.detailLabel_2.snp.bottom).offset(5)
        }
        detailLabel_4.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).inset(25)
            make.top.equalTo(self.detailLabel_3.snp.bottom).offset(5)
        }
        
    }
}

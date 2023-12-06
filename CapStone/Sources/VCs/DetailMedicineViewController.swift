//
//  DetailMedicineViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/12/01.
//

import Foundation
import UIKit

class DetailMedicineViewController: UIViewController {
    
    private let diseaseImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "medicine_test1")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "노스카나 젤"
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "9,000원"
        label.numberOfLines = 1
        return label
    }()
    
    private let detailLabel_1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "4년 연속 판매 1위인 인기있는 여드름 흉터 치료제"
        label.numberOfLines = 1
        return label
    }()
    
    private let detailLabel_2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "주성분 - 헤파린나트륨, 알라토인, 덱스판테놀"
        label.numberOfLines = 1
        return label
    }()
    
    private let detailLabel_3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "효능/효과 - 여드름 흉터, 비대성/켈로이드성 흉터의 개선"
        label.numberOfLines = 1
        return label
    }()
    
    private let detailLabel_4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "사용법 - 수시로 덧바르기"
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
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(280)
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

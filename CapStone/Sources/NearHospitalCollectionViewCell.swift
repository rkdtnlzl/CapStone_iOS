//
//  NearHospitalCollectionViewCell.swift
//  CapStone
//
//  Created by 강석호 on 2023/11/24.
//

import Foundation
import UIKit
import SnapKit


class NearHospitalCollectionViewCell: UICollectionViewCell {
    
    // 이미지 뷰
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // 텍스트 라벨
    let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let purchaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("구매하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor(r: 0, g: 111, b: 253), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.layer.borderWidth = 1.0 // 테두리 너비 설정
        button.layer.borderColor = UIColor(r: 0, g: 111, b: 253).cgColor // 파란색 테두리 설정
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 셀에 이미지 뷰와 텍스트 라벨 추가
        addSubview(imageView)
        addSubview(textLabel)
        addSubview(purchaseButton)
        
        // 이미지 뷰와 텍스트 라벨의 레이아웃 설정
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(self.imageView.snp.trailing).offset(15)
        }
        
        purchaseButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(90)
            make.height.equalTo(30)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

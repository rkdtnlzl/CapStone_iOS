//
//  NearHospitalViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/11/24.
//

import Foundation
import Foundation
import UIKit
import SnapKit


class NearHospitalViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let nearHospitalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // UICollectionView 설정
        nearHospitalCollectionView.dataSource = self
        nearHospitalCollectionView.delegate = self
        nearHospitalCollectionView.register(NearHospitalCollectionViewCell.self, forCellWithReuseIdentifier: "NearHospitalCollectionViewCell") // 셀 등록
        
        view.addSubview(nearHospitalCollectionView)
        nearHospitalCollectionView.frame = view.bounds
    }
    
    // MARK: UICollectionViewDataSource
    
    // 섹션당 아이템 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    // 셀 생성 및 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NearHospitalCollectionViewCell", for: indexPath) as! NearHospitalCollectionViewCell

        // 이미지 설정
        cell.imageView.image = UIImage(named: "hospital_test1") // 이미지 파일 이름으로 변경
        cell.imageView.layer.cornerRadius = 20

        // 텍스트 설정
        cell.textLabel.text = "미즈 피부과"
        cell.descriptionLabel.text = "서울 광진구 광나루로 355"
        
        cell.viewController = self

        return cell
    }
    
    // 셀 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width - 30 // 셀의 폭은 콜렉션 뷰 폭에서 좌우 여백(15 + 15)을 뺀 값
        let cellHeight: CGFloat = 120 // 셀의 높이
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}


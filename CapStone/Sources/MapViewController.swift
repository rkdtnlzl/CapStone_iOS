//
//  MapViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/11/17.
//

import Foundation
import NMapsMap

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let naverMapView = NMFNaverMapView(frame: view.frame)
        view.addSubview(naverMapView)
        
        self.navigationItem.title = "미즈 피부과"
        
        self.navigationController?.navigationBar.topItem?.title = ""

        naverMapView.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

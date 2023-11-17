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
        let naverMapView = NMFNaverMapView(frame: view.frame)
        view.addSubview(naverMapView)
    }
}

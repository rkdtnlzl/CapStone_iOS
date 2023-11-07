//
//  LearningViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/11/05.
//

import Foundation
import UIKit

class LearningViewController: UIViewController {
    
    
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.66 // 초기 프로그레스 25%
        return progressView
    }()
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "추천 중"
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(r: 113, g: 114, b: 122)
        label.textAlignment = .left
        label.text = "30초~1분정도 소요됩니다."
        label.numberOfLines = 1
        return label
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        // Create an indicator.
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = self.view.center
        activityIndicator.color = UIColor.blue
        // Also show the indicator even when the animation is stopped.
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.white
        // Start animation.
        activityIndicator.startAnimating()
        activityIndicator.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        return activityIndicator
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("결과보기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(r: 135, g: 150, b: 170)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.isEnabled = false
        return button
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
        
        // 10초 후에 애니메이션 중지하고 이미지 뷰 추가
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.removeFromSuperview()
            self?.loadingLabel.isHidden = true
            self?.descriptionLabel.isHidden = true
            self?.nextButton.isEnabled = true
            self?.nextButton.backgroundColor = UIColor(r: 0, g: 111, b: 253)
            
            // 이미지 뷰 추가
            let imageView = UIImageView(image: UIImage(named: "complete"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self?.view.addSubview(imageView)
            
            let completionLabel = UILabel()
            completionLabel.translatesAutoresizingMaskIntoConstraints = false
            completionLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            completionLabel.textColor = .black
            completionLabel.textAlignment = .center
            completionLabel.text = "추천완료"
            completionLabel.numberOfLines = 1
            self?.view.addSubview(completionLabel)
            
            
            imageView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.equalTo(50)
                make.height.equalTo(50)
            }
            completionLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(imageView.snp.bottom).offset(9)
            }
            
            self?.progressBar.setProgress(1.0, animated: true)
            
        }
        
        self.view.addSubview(progressBar)
        self.view.addSubview(self.activityIndicator)
        self.view.addSubview(loadingLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(nextButton)
        
        progressBar.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(34)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(40) // 프로그레스바의 상단을 조절
            make.height.equalTo(10) // 프로그레스바 높이 설정
        }
        
        loadingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.activityIndicator.snp.bottom).offset(15)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.loadingLabel.snp.bottom).offset(20)
        }
        
        self.nextButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(24)
            make.height.equalTo(48)
        }

        self.nextButton.addTarget(self, action: #selector(onPressNextButton), for: .touchUpInside)
    }
    
    @objc func onPressNextButton(sender: UIButton) {
        let resultView = ResultViewController()
        self.navigationController?.pushViewController(resultView, animated: true)
    }
    
    @objc func goToHome() {
        // 홈 버튼을 눌렀을 때 실행할 코드를 작성
        // 예를 들어, 다른 뷰 컨트롤러로 이동하는 코드를 여기에 추가
         let homeViewController = MainViewController()
         self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

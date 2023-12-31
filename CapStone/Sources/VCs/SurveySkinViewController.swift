//
//  SurveyAgeViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/10/27.
//
import Foundation
import UIKit
import AVFoundation

class SurveySkinViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var sex : String = ""
    private var selectedImage: UIImage?
    
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.25 // 초기 프로그레스 25%
        return progressView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "피부를 촬영해주세요"
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(r: 113, g: 114, b: 122)
        label.textAlignment = .left
        label.text = "카메라 성능 및 이미지의 해상도가 높을수록 성능이 높아집니다"
        label.numberOfLines = 1
        return label
    }()
    
    private let cameraButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("사진 촬영", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor(r: 181, g: 215, b: 234)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(r: 0, g: 111, b: 253)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
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
        
        self.view.addSubview(progressBar)
        self.view.addSubview(mainLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(nextButton)
        self.view.addSubview(cameraButton)
        
        progressBar.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(34)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(40) // 프로그레스바의 상단을 조절
            make.height.equalTo(10) // 프로그레스바 높이 설정
        }
        
        mainLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.top.equalTo(self.progressBar.snp.bottom).offset(40)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.top.equalTo(self.mainLabel.snp.bottom).offset(10)
        }
        cameraButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(34)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(34)
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(43)
            make.height.equalTo(50)
        }
        
        self.nextButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(50)
            make.height.equalTo(48)
        }
        
        // 카메라 버튼에 액션을 추가합니다.
        cameraButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        
        nextButton.addTarget(self, action: #selector(onPressNextButton), for: .touchUpInside)
        
    }
    
    @objc func openCamera() {
        // 카메라를 열기 위한 설정
        checkCameraPermission()
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        // 카메라 뷰를 표시
        present(imagePicker, animated: true, completion: nil)
    }
    
    // UIImagePickerControllerDelegate에서 필요한 메서드를 구현합니다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // 이미지를 저장
            self.selectedImage = selectedImage
            progressBar.setProgress(0.66, animated: true)
            
            // 선택한 이미지를 표시할 UIImageView를 생성하고 설정
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.image = selectedImage
            
            // 이미지 뷰를 화면에 추가
            view.addSubview(imageView)
            
            // 이미지 뷰의 제약 조건 설정
            imageView.snp.makeConstraints { make in
                make.top.equalTo(cameraButton.snp.bottom).offset(50)
                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(54)
                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(54)
                make.bottom.equalTo(nextButton.snp.top).offset(-50)
            }
        }
        
        // 카메라 뷰를 닫습니다.
        picker.dismiss(animated: true, completion: nil)
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 카메라 뷰를 취소하고 닫습니다.
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func checkCameraPermission(){
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
            if granted {
                print("Camera: 권한 허용")
            } else {
                print("Camera: 권한 거부")
            }
        })
    }
    
    @objc func onPressNextButton(sender: UIButton) {
        
        uploadImageToServer()
        
        let learningView = LearningViewController()
        self.navigationController?.pushViewController(learningView, animated: true)
    }
    
    @objc func goToHome() {
        // 홈 버튼을 눌렀을 때 실행할 코드를 작성
        // 예를 들어, 다른 뷰 컨트롤러로 이동하는 코드를 여기에 추가
         let homeViewController = MainViewController()
         self.navigationController?.pushViewController(homeViewController, animated: false)
    }
    
    func uploadImageToServer() {
        guard let selectedImage = selectedImage else {
            // 이미지가 선택되지 않은 경우
            return
        }

        LearningService.shared.uploadImage(image: selectedImage) { result in
            switch result {
            case .success(let data):
                // 성공적으로 이미지를 업로드한 경우
                print("Image uploaded successfully: \(data)")
            case .pathErr:
                // 경로 오류 발생
                print("Path error during image upload")
            case .serverErr:
                // 서버 오류 발생
                print("Server error during image upload")
            case .networkFail:
                // 네트워크 오류 발생
                print("Network error during image upload")
            case .requestErr(_):
                print("requestErr")
            }
        }
    }
}

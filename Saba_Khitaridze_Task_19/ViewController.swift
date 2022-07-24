//
//  ViewController.swift
//  Saba_Khitaridze_Task_19
//
//  Created by Saba Khitaridze on 21.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Vars
    private let gradientMaskLayer = CAGradientLayer()
    private lazy var viewWidth = view.frame.width
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        view.addSubview(label)
        return label
    }()
    
    private lazy var logoView: UIView = {
        var logo = UIView()
        view.addSubview(logo)
        return logo
    }()
    
    private lazy var imageView: UIImageView = {
        var image = UIImageView()
        return image
    }()
    
    private lazy var emailTextField: UITextField = {
        var textField = UITextField()
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Email"
        textField.layer.cornerRadius = 20
        textField.addShadow()
        //adding height constraint just for the first textField because of stack view
        NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal,toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Password"
        textField.layer.cornerRadius = 20
        textField.addShadow()
        return textField
    }()
    
    private lazy var textFieldstackView: UIStackView = {
        let stackView = UIStackView()
        view.addSubview(stackView)
        return stackView
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        view.addSubview(button)
        return button
    }()
    
    private lazy var signUpLabel: UILabel = {
       let label = UILabel()
        view.addSubview(label)
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
       let button = UIButton()
        view.addSubview(button)
        return button
    }()
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.gradientForView(with: gradientMaskLayer)
        addEveryComponent()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradientMaskLayer.frame = view.layer.bounds
    }
    
    //MARK: - Methods
    
    private func addEveryComponent() {
        addTitleLabel()
        addLogoView()
        addStackView()
        addSignInButton()
        addSignUpLabel()
        addSignUpButton()
    }
    
    private func addTitleLabel() {
        //configuration
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "iOS App Templates"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        
        //top
        let topConstraint = NSLayoutConstraint(item: titleLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view.safeAreaLayoutGuide,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 20)
        //left
        let leadingConstraint = NSLayoutConstraint(item: titleLabel,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: view.safeAreaLayoutGuide,
                                                attribute: .leading,
                                                multiplier: 1,
                                                constant: 10)
        //right
        let trailingConstraint = NSLayoutConstraint(item: titleLabel,
                                                 attribute: .trailing,
                                                 relatedBy: .equal,
                                                 toItem: view.safeAreaLayoutGuide,
                                                 attribute: .trailing,
                                                 multiplier: 1,
                                                 constant: 10)
        //height
        let height = NSLayoutConstraint(item: titleLabel,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: 35)
            
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, height])
    }
    
    private func addLogoView() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.cornerRadius = viewWidth/3.2
        logoView.backgroundColor = UIColor(red: 0.30, green: 0.32, blue: 0.72, alpha: 1.00)
        logoView.layer.borderWidth = 4
        logoView.layer.borderColor = UIColor.white.cgColor
        logoView.layer.addShadow()
        addLogoInView()
        
        //centerX
        let centerX = logoView.setCenterX(equalTo: view)
        //top
        let topConstraint = NSLayoutConstraint(item: logoView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: titleLabel,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: viewWidth/6)
        //width
        let width = NSLayoutConstraint(item: logoView,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: viewWidth/1.6)
        //aspect ratio
        let aspectRatio = NSLayoutConstraint(item: logoView,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: logoView,
                                             attribute: .width,
                                             multiplier: 1,
                                             constant: 0)
        
        NSLayoutConstraint.activate([centerX, topConstraint, width, aspectRatio])
    }
    
    private func addLogoInView() {
        imageView = UIImageView(image: UIImage(named: "rocket"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        logoView.addSubview(imageView)
        
        let centerX = imageView.setCenterX(equalTo: logoView)
        let centerY = imageView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor)
        
        //width
        let width = NSLayoutConstraint(item: imageView,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: viewWidth/1.7)
        //aspect ratio
        let aspectRatio = NSLayoutConstraint(item: imageView,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: imageView,
                                             attribute: .width,
                                             multiplier: 1,
                                             constant: 0)
        
        NSLayoutConstraint.activate([centerX, centerY, width, aspectRatio])
    }
    
    private func addStackView() {
        textFieldstackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldstackView.axis = .vertical
        textFieldstackView.spacing = 15.0
        textFieldstackView.alignment = .fill
        textFieldstackView.distribution = .fillEqually
        [emailTextField, passwordTextField].forEach{ textFieldstackView.addArrangedSubview($0) }
        
        //centerX
        let centerX = textFieldstackView.setCenterX(equalTo: view)
        //top
        let topConstraint = NSLayoutConstraint(item: textFieldstackView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: logoView,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: 50)
        //left
        let leadingConstraint = NSLayoutConstraint(item: textFieldstackView,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: view.safeAreaLayoutGuide,
                                                attribute: .leading,
                                                multiplier: 1,
                                                constant: 20)
        //right
        let trailingConstraint = NSLayoutConstraint(item: textFieldstackView,
                                                attribute: .trailing,
                                                relatedBy: .equal,
                                                toItem: view.safeAreaLayoutGuide,
                                                attribute: .trailing,
                                                multiplier: 1,
                                                constant: -20)
                
        NSLayoutConstraint.activate([centerX, topConstraint, leadingConstraint, trailingConstraint])
    }
    
    private func addSignInButton() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.layer.cornerRadius = 15
        signInButton.layer.addShadow()
        signInButton.backgroundColor = .systemGreen
        signInButton.titleLabel?.textColor = .white
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        signInButton.setTitle("Sign In", for: .normal)
        
        //centerX
        let centerX = signInButton.setCenterX(equalTo: view)
        //top
        let topConstraint = NSLayoutConstraint(item: signInButton,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: textFieldstackView,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: 50)
        //left
        let leadingConstraint = NSLayoutConstraint(item: signInButton,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: textFieldstackView,
                                                attribute: .leading,
                                                multiplier: 1,
                                                constant: 30)
        //right
        let trailingConstraint = NSLayoutConstraint(item: signInButton,
                                                 attribute: .trailing,
                                                 relatedBy: .equal,
                                                 toItem: textFieldstackView,
                                                 attribute: .trailing,
                                                 multiplier: 1,
                                                 constant: -30)
        //height
        let height = NSLayoutConstraint(item: signInButton,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 45)
                
        NSLayoutConstraint.activate([centerX, topConstraint, leadingConstraint, trailingConstraint, height])
    }
    
    private func addSignUpLabel() {
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.text = "Don't have an account?"
        
        //centerX
        let centerX = signUpLabel.setCenterX(equalTo: view, constant: -30)
        
        //right
        let trailingConstraint = NSLayoutConstraint(item: signUpLabel,
                                                 attribute: .trailing,
                                                 relatedBy: .equal,
                                                 toItem: signUpButton,
                                                 attribute: .leading,
                                                 multiplier: 1,
                                                 constant: -5)
        //bottom
        let bottomConstraint = NSLayoutConstraint(item: signUpLabel,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view.safeAreaLayoutGuide,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: -5)
        //height
        let height = NSLayoutConstraint(item: signUpLabel,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 15)
                
        NSLayoutConstraint.activate([centerX, trailingConstraint, bottomConstraint, height])
    }
    
    private func addSignUpButton() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
    
        //bottom
        let bottomConstraint = NSLayoutConstraint(item: signUpButton,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: signUpLabel,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: 0)
        //height
        let height = NSLayoutConstraint(item: signUpButton,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: signUpLabel,
                                        attribute: .height,
                                        multiplier: 1,
                                        constant: 0)
        
        NSLayoutConstraint.activate([bottomConstraint, height])
    }
    
}



//MARK: - Preview

//import SwiftUI
//
//struct PreviewViewController: PreviewProvider {
//    static var previews: some View {
//        ViewControllerPreview {
//            ViewController()
//
//        }.previewDevice("iPhone 13 Pro").previewInterfaceOrientation(.portrait)
//    }
//}
//
//struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
//    let viewControllerBuilder: () -> UIViewController
//
//    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
//        self.viewControllerBuilder = viewControllerBuilder
//    }
//
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        return viewControllerBuilder()
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//}

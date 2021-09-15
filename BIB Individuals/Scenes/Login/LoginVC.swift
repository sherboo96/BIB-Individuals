//
//  LoginVC.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var lblLangauge: UILabel!
    @IBOutlet weak var lblWelcomeTitle: UILabel!
    @IBOutlet weak var lblDescribeTitle: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblResetPassword: UILabel!
    @IBOutlet weak var lblCreateAccount: UILabel!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnMainLogin: UIButton!
    @IBOutlet weak var btnFBLogin: ISRadioButton!
    @IBOutlet weak var btnGoogleLogin: UIButton!
    
    //MARK: - variable
    var presenter: LoginPresenterProtocol!
    
    init() {
        super.init(nibName: "LoginVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) hasn't been implemented")
    }
    
    //MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        self.didReceiveMemoryWarning()
    }
    
    //MARK: - Helper Functions
    private func setupUI() {
        //Colors
        self.lblLangauge.textColor = DesignSystem.Colors.primary.color
        self.lblWelcomeTitle.textColor = DesignSystem.Colors.textPrimary.color
        self.lblDescribeTitle.textColor = DesignSystem.Colors.textSecondary.color
        self.lblEmail.textColor = DesignSystem.Colors.textSecondary.color
        self.lblPassword.textColor = DesignSystem.Colors.textSecondary.color
        self.lblResetPassword.textColor = DesignSystem.Colors.textSecondary.color
        self.lblCreateAccount.textColor = DesignSystem.Colors.textSecondary.color
        
        self.txtEmail.textColor = DesignSystem.Colors.primary.color
        self.txtPassword.textColor = DesignSystem.Colors.primary.color
        
        self.btnMainLogin.setTitleColor(DesignSystem.Colors.white.color, for: .normal)
        self.btnFBLogin.setTitleColor(DesignSystem.Colors.white.color, for: .normal)
        self.btnGoogleLogin.setTitleColor(DesignSystem.Colors.white.color, for: .normal)
        
        self.btnMainLogin.backgroundColor = DesignSystem.Colors.primary.color
//        self.btnFBLogin.backgroundColor = DesignSystem.Colors.primary.color
        self.btnGoogleLogin.backgroundColor = DesignSystem.Colors.primary.color
        
        self.btnFBLogin.icon = #imageLiteral(resourceName: "uncheck")
        self.btnFBLogin.setIconSelected = #imageLiteral(resourceName: "check")
        
        //Fonts
        self.lblLangauge.font = DesignSystem.TypoGraphy.description.font
        self.lblWelcomeTitle.font = DesignSystem.TypoGraphy.title.font
        self.lblDescribeTitle.font = DesignSystem.TypoGraphy.description.font
        self.lblEmail.font = DesignSystem.TypoGraphy.description.font
        self.lblPassword.font = DesignSystem.TypoGraphy.description.font
        self.lblCreateAccount.font = DesignSystem.TypoGraphy.description.font
        self.lblCreateAccount.font = DesignSystem.TypoGraphy.description.font
        
        self.txtEmail.font = DesignSystem.TypoGraphy.description.font
        self.txtPassword.font = DesignSystem.TypoGraphy.description.font
        
        self.btnMainLogin.titleLabel?.font = DesignSystem.TypoGraphy.header.font
        self.btnFBLogin.titleLabel?.font = DesignSystem.TypoGraphy.header.font
        self.btnGoogleLogin.titleLabel?.font = DesignSystem.TypoGraphy.header.font
        
        self.btnMainLogin.layer.cornerRadius = 16
        self.btnFBLogin.layer.cornerRadius = 16
        self.btnGoogleLogin.layer.cornerRadius = 16
        
        self.lblWelcomeTitle.setActivePart(orignalText: "Hello Mahmoud World!", hyberText: ["Mahmoud", "World"], hyberTextColor: ["119AE8", "119AE8"], hyberTextFont: [DesignSystem.TypoGraphy.header.font, DesignSystem.TypoGraphy.title.font])
        
        let gesture = MyTapGesture(target:self, action: #selector(self.tapLabel(_:)))
        self.lblWelcomeTitle.addGestureRecognizer(gesture)
    }
    
    @objc func tapLabel(_ gesture: MyTapGesture) {
        let tappedTextPart = ("Hello Mahmoud World!" as NSString).range(of: "Mahmoud")
        let tappedWordTextPart = ("Hello Mahmoud World!" as NSString).range(of: "World")
        if gesture.didTapAttributedTextInLabel(label: self.lblWelcomeTitle, inRange: tappedTextPart) {
            print("Tapped")
        } else if gesture.didTapAttributedTextInLabel(label: self.lblWelcomeTitle, inRange: tappedWordTextPart) {
            print("Printed")
        }
    }
    
    private func checkVaildaiton() {
        if String.getString(self.txtEmail?.text).isEmpty {
            UIAlertController.showAlertMessage(ErrorMessage.kEmptyEmail)
            return
        } else if !(String.getString(self.txtEmail?.text).isEmail) {
            UIAlertController.showAlertMessage(ErrorMessage.kInvalidEmail)
            return
        } else {
            if String.getString(self.txtPassword?.text).isEmpty {
                UIAlertController.showAlertMessage(ErrorMessage.kEmptyPassword)
                return
            } else if !(String.getString(self.txtPassword?.text).isValidPassword) {
                UIAlertController.showAlertMessage(ErrorMessage.kInvalidPassword)
                return
            } else {
                self.presenter.loginUser(userCreditionals: [self.txtEmail?.text ?? "", self.txtPassword?.text ?? ""])
            }
        }
    }
    
    //MARK: - IBAction
    @IBAction func mainLoginTapped(_ sender: UIButton) {
        self.checkVaildaiton()
    }
    
    @IBAction func fbLoginTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func googleLoginTapped(_ sender: UIButton) {
        //TODO: - Google Login Integrate
    }
}

extension LoginVC: LoginViewProtocol {
    func showLoaderView() {
        print("Show Loader")
    }
    
    func hideLoaderView() {
        print("Hide Loader")
    }
    
    func showError(message: String) {
        UIAlertController.showAlertMessage(message)
        return
    }
}

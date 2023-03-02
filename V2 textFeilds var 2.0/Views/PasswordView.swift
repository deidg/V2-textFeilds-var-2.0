////
////  PasswordView.swift
////  V2 textFeilds var 2.0
////
////  Created by Alex on 02.03.2023.
////
//
//
//import UIKit
//import SnapKit
//import SafariServices
//
//class : UIView {
//
//let passwordRegex: String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-z\\d]{7,25}"
//
//
//    //MARK: UI Elements
//
//let linkLabel: UILabel = {
//    let linkLabel = UILabel()
//    linkLabel.text = Constants.LabelsTexts.linkLabelText
//    linkLabel.backgroundColor = .white
//    linkLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
//    linkLabel.font = Constants.LabelsFonts.smallLabelFont
//    return linkLabel
//}()
//let linkTextView: UIView = {
//    let linkTextView = UIView()
//    linkTextView.backgroundColor = Constants.TextFields.textFieldBackgroundColor
//    linkTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
//    return linkTextView
//}()
//let linkTextField: UITextField = {
//    let linkTextField = UITextField()
//    linkTextField.placeholder = Constants.TextFields.linkTextFieldPlaceholderText
//    linkTextField.textColor = Constants.TextFields.textFieldTextColor
//    linkTextField.font = Constants.TextFields.textFieldFont
//    linkTextField.keyboardType = .URL
//    return linkTextField
//}()
//
//    //MARK: Initialization
//    init() {
//        super.init(frame: .zero)
//        setupUI()
//        defaultConfiguration()
//    }
//
//    required init?(coder: NSCoder) {
//        return nil
//    }
//    //MARK: Methods
//    private func setupUI() {
//        addSubview(validationLabel)
//        validationLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(20)
//        }
//
//        addSubview(passwordTextView)
//        passwordTextView.snp.makeConstraints { make in
//            make.top.equalTo(validationLabel.snp.bottom).offset(4)
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(36)
//        }
//
//        addSubview(passwordTextField)
//        passwordTextField.snp.makeConstraints { make in
//            make.top.equalTo(passwordTextView.snp.top).offset(7)
//            make.leading.trailing.equalToSuperview().inset(8)
//            make.height.equalTo(22)
//        }
//
//
//
//            addSubview(validationRulesView)
//        validationRulesView.snp.makeConstraints { make in
//         // make.top.equalTo(passwordTextView.snp.bottom).offset(8)
//        //  make.leading.trailing.equalToSuperview()
//            make.top.equalTo(passwordTextView.snp.bottom).offset(8)
//            make.leading.trailing.equalToSuperview().inset(24)
//            make.height.equalTo(120)
//        }
//
//микролейблы
//микролейбл1
//validationRulesView.addSubview(validationMinLengthLabel)
//validationMinLengthLabel.snp.makeConstraints{ make in
//    make.top.equalTo(validationRulesView.snp.bottom).offset(8)
//    make.leading.equalToSuperview().inset(10) //24
//    make.trailing.equalToSuperview().inset(180)
//    make.height.equalTo(15)
//}
//
//
//микролейбл2
//validationRulesView.addSubview(validationDigitLabel)
//validationDigitLabel.snp.makeConstraints{ make in
//    make.top.equalTo(validationMinLengthLabel.snp.bottom).offset(8)
//    make.leading.equalToSuperview().inset(10) //24
//    make.trailing.equalToSuperview().inset(180)
//    make.height.equalTo(15)
//}
//
//микролейбл3
//validationRulesView.addSubview(validationLowerCaseLabel)
//validationLowerCaseLabel.snp.makeConstraints{ make in
//    make.top.equalTo(validationDigitLabel.snp.bottom).offset(8)
//    make.leading.equalToSuperview().inset(10) //24
//    make.trailing.equalToSuperview().inset(180)
//    make.height.equalTo(15)
//}
//
//микролейбл4
//validationRulesView.addSubview(validationCapitalCaseLabel)
//validationCapitalCaseLabel.snp.makeConstraints{ make in
//    make.top.equalTo(validationLowerCaseLabel.snp.bottom).offset(8)
//    make.leading.equalToSuperview().inset(10) //24
//    make.trailing.equalToSuperview().inset(180)
//    make.height.equalTo(15)
//}
//
//
//
//    }
//
//    private func defaultConfiguration() {
//        backgroundColor = .white
//    }
//}
//
//
//extension  LinkView: UITextFieldDelegate  {
//
//func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//    if textField == linkTextField {
//
//        let link = linkTextField.text ?? ""
//        func isLinkValid(_ link : String) -> Bool {
//            let linkTest = NSPredicate(format: "SELF MATCHES %@", linkRegex)
//            return linkTest.evaluate(with: link)
//        }
//        if isLinkValid(link) {
//            print("its valid LINK")
//
//            //НУЖНЫЙ КОД 0 откладывает открытие ссылки
////            let delay : Double = 2.0 // 5.0
////            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
////                func startBrowser(_ sender: Any) {
////                    if let urlString = self.linkTextField.text {
////                        let url: URL?
////                        if urlString.hasPrefix("http://") {
////                            url = URL(string: urlString)
////                        } else {
////                            url = URL(string: "http://" + urlString)
////                        }
////                        if let url = url {
////                            let sfViewController = SFSafariViewController(url: url)
////                            self.present(sfViewController, animated: true, completion: nil)
////                            print ("Now browsing in SFSafariViewController")
////                        }
////                    }
////                }
////                startBrowser(self.linkTextField)
////            }
//        } else {
//            print("NOT valid link")
//        }
//    }
//    return true
//}
//
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let allowedCharacters = CharacterSet.decimalDigits.inverted
//        let charSet = CharacterSet(charactersIn: string)
//        return allowedCharacters.isSuperset(of: charSet)
//    }
//
//    enum Constants {
//        enum LabelsSettings {
//            static let lettersTextViewCornerRadius: CGFloat = 10
//        }
//        enum LabelsFonts {
//            static let mainLabelFont = UIFont(name: "Rubik-Medium", size: 34)
//            static let smallLabelFont = UIFont(name: "Rubik", size: 13)
//        }
//
//        enum LabelsTexts {
//            static let mainTitleLabeText = "Text Fields"
//            static let noDigitLabelText = "NO digit field"
//            static let inputLimitLabelText = "Input limit"
//            static let charactersCounterText = "0/10"
//            static let onlyCharectersLabelText = "Only characters"
//            static let linkLabelText = "Link"
//            static let validationLabelText = "Validation rules"
//            static let validationMinLengthLabelText = "Min length 8 characters,"
//            static let validationDigitLabelText = "Min 1 digit,"
//            static let validationLowerCaseLabelText = "Min 1 lowercase,"
//            static let validationCapitalCaseLabelText = "Min 1 capital required.\n"
//            static let smallLabelTextColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
//            static let validationRulesLabelTextColor = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1)
//        }
//        enum LabelsBackgroundColors {
//            static let labelBackgoundColors = UIColor.white
//        }
//        enum TextFields {
//            static let lettersTextFieldPlaceholderText = "Type here"
//            static let onlyCharectersLabelPlaceholderText = "wwwww-ddddd"
//            static let linkTextFieldPlaceholderText = "www.example.com"
//            static let passwordTextFieldPlaceholderText = "Password"
//            static let textFieldFont = UIFont(name: "Rubik", size: 17)
//            static let textFieldTextColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
//            static let viewBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
//            static let textFieldBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
//        }
//    }
//}
//

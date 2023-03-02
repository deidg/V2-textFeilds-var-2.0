//
//  PasswordView.swift
//  V2 textFeilds var 2.0
//
//  Created by Alex on 02.03.2023.
//


import UIKit
import SnapKit
import SafariServices

class PasswordView: UIView {

let passwordRegex: String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-z\\d]{7,25}"


    //MARK: UI Elements

        let validationLabel: UILabel = {
            let validationLabel = UILabel()
            validationLabel.text = Constants.LabelsTexts.validationLabelText
            validationLabel.backgroundColor = .white
            validationLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
            validationLabel.font = Constants.LabelsFonts.smallLabelFont
            return validationLabel
        }()
        let passwordTextView: UIView = {
            let passwordTextView = UIView()
            passwordTextView.backgroundColor = Constants.TextFields.textFieldBackgroundColor
            passwordTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
            return passwordTextView
        }()
        let passwordTextField: UITextField = {
            let passwordTextField = UITextField()
            passwordTextField.placeholder = Constants.TextFields.passwordTextFieldPlaceholderText
            passwordTextField.textColor = Constants.TextFields.textFieldTextColor
            passwordTextField.font = Constants.TextFields.textFieldFont
            return passwordTextField
        }()
        let validationRulesView: UIView = {
            let validationRulesView = UIView()
            return validationRulesView
        }()
    
    let validationMinLengthLabel: UILabel = {
        let validationMinLengthLabel = UILabel()
        validationMinLengthLabel.text = Constants.LabelsTexts.validationMinLengthLabelText
        validationMinLengthLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        validationMinLengthLabel.font = Constants.LabelsFonts.smallLabelFont
        return validationMinLengthLabel
    }()
    let validationDigitLabel: UILabel = {
        let validationDigitLabel = UILabel()
        validationDigitLabel.text = Constants.LabelsTexts.validationDigitLabelText
        validationDigitLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        validationDigitLabel.font = Constants.LabelsFonts.smallLabelFont
        return validationDigitLabel
    }()
    let validationLowerCaseLabel: UILabel = {
        let validationLowerCaseLabel = UILabel()
        validationLowerCaseLabel.text = Constants.LabelsTexts.validationLowerCaseLabelText
        validationLowerCaseLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        validationLowerCaseLabel.font = Constants.LabelsFonts.smallLabelFont
        return validationLowerCaseLabel
    }()
    let validationCapitalCaseLabel: UILabel = {
        let validationCapitalCaseLabel = UILabel()
        validationCapitalCaseLabel.text = Constants.LabelsTexts.validationCapitalCaseLabelText
        validationCapitalCaseLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        validationCapitalCaseLabel.font = Constants.LabelsFonts.smallLabelFont
        return validationCapitalCaseLabel
    }()
   
    
    
    
    

    //MARK: Initialization
    init() {
        super.init(frame: .zero)
        setupUI()
        defaultConfiguration()
    }

    required init?(coder: NSCoder) {
        return nil
    }
    //MARK: Methods
    private func setupUI() {
        addSubview(validationLabel)
        validationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }

        addSubview(passwordTextView)
        passwordTextView.snp.makeConstraints { make in
            make.top.equalTo(validationLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(36)
        }

        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextView.snp.top).offset(7)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(22)
        }



            addSubview(validationRulesView)
        validationRulesView.snp.makeConstraints { make in
         // make.top.equalTo(passwordTextView.snp.bottom).offset(8)
        //  make.leading.trailing.equalToSuperview()
            make.top.equalTo(passwordTextView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120)
        }

//микролейблы
//микролейбл1
validationRulesView.addSubview(validationMinLengthLabel)
validationMinLengthLabel.snp.makeConstraints{ make in
    make.top.equalTo(validationRulesView.snp.top).offset(8)
    make.leading.equalToSuperview()//.inset() //24
    make.trailing.equalToSuperview()//.inset(200)
    make.height.equalTo(15)
}


//микролейбл2
validationRulesView.addSubview(validationDigitLabel)
validationDigitLabel.snp.makeConstraints{ make in
    make.top.equalTo(validationMinLengthLabel.snp.bottom).offset(8)
    make.leading.equalToSuperview()//.inset() //24
    make.trailing.equalToSuperview()//.inset(200)
    make.height.equalTo(15)
}

//микролейбл3
validationRulesView.addSubview(validationLowerCaseLabel)
validationLowerCaseLabel.snp.makeConstraints{ make in
    make.top.equalTo(validationDigitLabel.snp.bottom).offset(8)
    make.leading.equalToSuperview()//.inset() //24
    make.trailing.equalToSuperview()//.inset(200)
    make.height.equalTo(15)
}

//микролейбл4
validationRulesView.addSubview(validationCapitalCaseLabel)
validationCapitalCaseLabel.snp.makeConstraints{ make in
    make.top.equalTo(validationLowerCaseLabel.snp.bottom).offset(8)
    make.leading.equalToSuperview()//.inset() //24
    make.trailing.equalToSuperview()//.inset(200)
    make.height.equalTo(15)
}



    }

    private func defaultConfiguration() {
        backgroundColor = .white
    }
}


extension  PasswordView: UITextFieldDelegate  {


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits.inverted
        let charSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: charSet)
    }

    enum Constants {
        enum LabelsSettings {
            static let lettersTextViewCornerRadius: CGFloat = 10
        }
        enum LabelsFonts {
            static let mainLabelFont = UIFont(name: "Rubik-Medium", size: 34)
            static let smallLabelFont = UIFont(name: "Rubik", size: 13)
        }

        enum LabelsTexts {
            static let mainTitleLabeText = "Text Fields"
            static let noDigitLabelText = "NO digit field"
            static let inputLimitLabelText = "Input limit"
            static let charactersCounterText = "0/10"
            static let onlyCharectersLabelText = "Only characters"
            static let linkLabelText = "Link"
            static let validationLabelText = "Validation rules"
            static let validationMinLengthLabelText = "Min length 8 characters,"
            static let validationDigitLabelText = "Min 1 digit,"
            static let validationLowerCaseLabelText = "Min 1 lowercase,"
            static let validationCapitalCaseLabelText = "Min 1 capital required.\n"
            static let smallLabelTextColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
            static let validationRulesLabelTextColor = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1)
        }
        enum LabelsBackgroundColors {
            static let labelBackgoundColors = UIColor.white
        }
        enum TextFields {
            static let lettersTextFieldPlaceholderText = "Type here"
            static let onlyCharectersLabelPlaceholderText = "wwwww-ddddd"
            static let linkTextFieldPlaceholderText = "www.example.com"
            static let passwordTextFieldPlaceholderText = "Password"
            static let textFieldFont = UIFont(name: "Rubik", size: 17)
            static let textFieldTextColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
            static let viewBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
            static let textFieldBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        }
    }
}


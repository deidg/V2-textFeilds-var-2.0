////
////  CounterView.swift
////  V2 textFeilds var 2.0
////
////  Created by Alex on 01.03.2023.
////
//
//import UIKit
//import SnapKit
//
//class CounterView: UIView {
//    
//    //MARK: UI Elements
//    
//    let inputLimitLabel: UILabel = {
//        let inputLimitLabel = UILabel()
//        inputLimitLabel.text = Constants.LabelsTexts.inputLimitLabelText
//        inputLimitLabel.backgroundColor = .white
//        inputLimitLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
//        inputLimitLabel.font = Constants.LabelsFonts.smallLabelFont
//        return inputLimitLabel
//    }()
//    var charactersCounter: UILabel = {
//        let charactersCounter = UILabel()
//        charactersCounter.backgroundColor = .white
//        charactersCounter.textAlignment = .right
//        charactersCounter.textColor = Constants.LabelsTexts.smallLabelTextColor
//        charactersCounter.font = Constants.LabelsFonts.smallLabelFont
//        charactersCounter.text = Constants.LabelsTexts.charactersCounterText
//        return charactersCounter
//    }()
//    let limitTextView: UIView = {
//        let limitTextView = UIView()
//        limitTextView.backgroundColor = .yellow
//        limitTextView.backgroundColor = Constants.TextFields.viewBackgroundColor
//        limitTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
//        return limitTextView
//    }()
//    let limitTextField: UITextField = {
//        let limitTextField = UITextField()
//        limitTextField.placeholder = Constants.TextFields.lettersTextFieldPlaceholderText
//        limitTextField.textColor = Constants.TextFields.textFieldTextColor
//        limitTextField.font = Constants.TextFields.textFieldFont
//        return limitTextField
//    }()
//    
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
//        addSubview(inputLimitLabel)
//        inputLimitLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(20)
//        }

//addSubview(charactersCounter)
//charactersCounter.snp.makeConstraints { make in
//    make.top.equalTo(lettersTextView.snp.bottom).offset(25)
//                make.trailing.equalToSuperview().inset(16)
//    //           make.leading.trailing.equalToSuperview()
//    make.height.equalTo(22)
//}

//        addSubview(lettersTextView)
//        lettersTextView.snp.makeConstraints { make in
//            make.top.equalTo(inputLimitLabel.snp.bottom).offset(4)
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(36)
//        }

//        addSubview(lettersTextField)
//        lettersTextField.snp.makeConstraints { make in
//            make.top.equalTo(lettersTextView.snp.top).offset(7)
//              make.leading.trailing.equalToSuperview().inset(8)
//            make.height.equalTo(22)
//        }
//    }
//    
//    private func defaultConfiguration() {
//        backgroundColor = .white
//    }
//}
//
//extension  NoDigitsView: UITextFieldDelegate  {
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

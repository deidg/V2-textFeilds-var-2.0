//
//  File.swift
//  V2 textFeilds var 2.0
//
//  Created by Vladyslav Nhuien on 27.02.2023.
//

import UIKit
import SnapKit

class NoDigitsView: UIView {
    
    //MARK: UI Elements
    let noDigitLabel: UILabel = {
        let noDigitLabel = UILabel()
        noDigitLabel.text = Constants.LabelsTexts.noDigitLabelText
        noDigitLabel.backgroundColor = Constants.LabelsBackgroundColors.labelBackgoundColors
        noDigitLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        noDigitLabel.font = Constants.LabelsFonts.smallLabelFont
        return noDigitLabel
    }()
    let lettersTextView: UIView = {
        let lettersTextView = UIView()
        lettersTextView.backgroundColor = Constants.TextFields.viewBackgroundColor
        lettersTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
        return lettersTextView
    }()
    let lettersTextField: UITextField = {
        let lettersTextField = UITextField()
        lettersTextField.placeholder = Constants.TextFields.lettersTextFieldPlaceholderText
        lettersTextField.textColor = Constants.TextFields.textFieldTextColor
        lettersTextField.font = Constants.TextFields.textFieldFont
        lettersTextField.isEnabled = true
        lettersTextField.keyboardType = .alphabet
        lettersTextField.becomeFirstResponder()
        return lettersTextField
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
        addSubview(noDigitLabel)
        noDigitLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        addSubview(lettersTextView)
        lettersTextView.snp.makeConstraints { make in
            make.top.equalTo(noDigitLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(36)
        }
        addSubview(lettersTextField)
        lettersTextField.snp.makeConstraints { make in
            make.top.equalTo(lettersTextView.snp.top).offset(7)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(22)
        }
    }
    
    private func defaultConfiguration() {
        backgroundColor = .white
        lettersTextField.delegate = self
    }
}

extension  NoDigitsView: UITextFieldDelegate  {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits.inverted
        let charSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: charSet)
    }
    
    //MARK: constants
    enum Constants {
        enum LabelsSettings {
            static let lettersTextViewCornerRadius: CGFloat = 10
        }
        enum LabelsFonts {
            static let smallLabelFont = UIFont(name: "Rubik", size: 13)
        }
        enum LabelsTexts {
            static let noDigitLabelText = "NO digit field"
            static let smallLabelTextColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
        }
        enum LabelsBackgroundColors {
            static let labelBackgoundColors = UIColor.white
        }
        enum TextFields {
            static let lettersTextFieldPlaceholderText = "Type here"
            static let textFieldFont = UIFont(name: "Rubik", size: 17)
            static let textFieldTextColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
            static let viewBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        }
    }
}

extension String {
    var containsValidCharacter: Bool {
        guard self != "" else { return true }
        let hexSet = CharacterSet(charactersIn: "1234567890")
        let newSet = CharacterSet(charactersIn: self)
        return hexSet.isSuperset(of: newSet)
    }
}

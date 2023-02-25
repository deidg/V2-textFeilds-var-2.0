//
//  ViewController.swift
//  V2 textFeilds var 2.0
//
//  Created by Alex on 22.02.2023.
//
//  Created by Alex on 07.02.2023.
//

import UIKit
import SnapKit
import SafariServices
import JMMaskTextField_Swift

final class ViewController: UIViewController {
    
    var activeTextField : UITextField? = nil
    
    let inputDigitRegex: String = "^([0-9]){5}$"
    let linkRegex: String = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
    
    
    //    "^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"
    let passwordRegex: String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-z\\d]{7,25}"
    let inputTextRegex: String = "^([a-zA-Z]{5})[-]([\\d]{5})$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnView()
        defaultConfiguration()
        
        lettersTextField.delegate = self
        limitTextField.delegate = self
        characterTextField.delegate = self
        linkTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: additional views
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        return contentView
    }()
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 100)
    }
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = Constants.LabelsTexts.mainTitleLabeText
        titleLabel.font = Constants.LabelsFonts.mainLabelFont
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .white
        return titleLabel
    }()
    
    //MARK: 1 field 1
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
    
    //MARK:  2 field 2
    let inputLimitLabel: UILabel = {
        let inputLimitLabel = UILabel()
        inputLimitLabel.text = Constants.LabelsTexts.inputLimitLabelText
        inputLimitLabel.backgroundColor = .white
        inputLimitLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        inputLimitLabel.font = Constants.LabelsFonts.smallLabelFont
        return inputLimitLabel
    }()
    var charactersCounter: UILabel = {
        let charactersCounter = UILabel()
        charactersCounter.backgroundColor = .white
        charactersCounter.textAlignment = .right
        charactersCounter.textColor = Constants.LabelsTexts.smallLabelTextColor
        charactersCounter.font = Constants.LabelsFonts.smallLabelFont
        charactersCounter.text = Constants.LabelsTexts.charactersCounterText
        return charactersCounter
    }()
    let limitTextView: UIView = {
        let limitTextView = UIView()
        limitTextView.backgroundColor = .yellow
        limitTextView.backgroundColor = Constants.TextFields.viewBackgroundColor
        limitTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
        return limitTextView
    }()
    let limitTextField: UITextField = {
        let limitTextField = UITextField()
        limitTextField.placeholder = Constants.TextFields.lettersTextFieldPlaceholderText
        limitTextField.textColor = Constants.TextFields.textFieldTextColor
        limitTextField.font = Constants.TextFields.textFieldFont
        return limitTextField
    }()
    
    //MARK:  3 field 3
    let onlyCharectersLabel: UILabel = {
        let onlyCharectersLabel = UILabel()
        onlyCharectersLabel.text = Constants.LabelsTexts.onlyCharectersLabelText
        onlyCharectersLabel.backgroundColor = .white
        onlyCharectersLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        onlyCharectersLabel.font = Constants.LabelsFonts.smallLabelFont
        return onlyCharectersLabel
    }()
    let characterTextView: UIView = {
        let characterTextView = UIView()
        characterTextView.backgroundColor = Constants.TextFields.textFieldBackgroundColor
        characterTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
        return characterTextView
    }()
    let characterTextField: JMMaskTextField = {
        let characterTextField = JMMaskTextField(frame:CGRect.zero)
        characterTextField.maskString = "AAAAA-00000"
        characterTextField.placeholder = "wwwww-ddddd"
        return characterTextField
    }()
    
    //MARK:  4 field 4  LINK
    let linkLabel: UILabel = {
        let linkLabel = UILabel()
        linkLabel.text = Constants.LabelsTexts.linkLabelText
        linkLabel.backgroundColor = .white
        linkLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        linkLabel.font = Constants.LabelsFonts.smallLabelFont
        return linkLabel
    }()
    let linkTextView: UIView = {
        let linkTextView = UIView()
        linkTextView.backgroundColor = Constants.TextFields.textFieldBackgroundColor
        linkTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
        return linkTextView
    }()
    let linkTextField: UITextField = {
        let linkTextField = UITextField()
        linkTextField.placeholder = Constants.TextFields.linkTextFieldPlaceholderText
        linkTextField.textColor = Constants.TextFields.textFieldTextColor
        linkTextField.font = Constants.TextFields.textFieldFont
        linkTextField.keyboardType = .URL
        return linkTextField
    }()
    
    //MARK:  5 field 5  PASSWORDS
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
    let validationRulesLabel: UILabel = {
        let validationRulesLabel = UILabel()
        validationRulesLabel.numberOfLines = 4
        validationRulesLabel.backgroundColor = .white
        validationRulesLabel.font = Constants.LabelsFonts.smallLabelFont
        validationRulesLabel.text = Constants.LabelsTexts.validationRulesLabelText
        validationRulesLabel.textColor = Constants.LabelsTexts.validationRulesLabelTextColor
        return validationRulesLabel
    }()
    
    private func setupItemsOnView() {
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.width.height.equalTo(scrollView)
        }
        
        //  Textlabel
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(92)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(41)
        }
        // 1 field 1
        contentView.addSubview(noDigitLabel)
        noDigitLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(163)
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        contentView.addSubview(lettersTextView)
        lettersTextView.snp.makeConstraints{make in
            make.top.equalTo(noDigitLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
        lettersTextView.addSubview(lettersTextField)
        lettersTextField.snp.makeConstraints{ make in
            make.leading.equalTo(lettersTextView).inset(8)
            make.top.equalTo(lettersTextView.snp.top).inset(7)
            make.bottom.equalTo(lettersTextView.snp.bottom).inset(7)
            make.height.equalTo(22)
        }
        // 2 field 2
        contentView.addSubview(inputLimitLabel)
        inputLimitLabel.snp.makeConstraints{ make in
            make.width.equalTo(78)
            make.height.equalTo(20)
            make.top.equalTo(lettersTextView.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(16)
        }
        contentView.addSubview(charactersCounter)
        charactersCounter.snp.makeConstraints{ make in
            make.width.equalTo(45)
            make.height.equalTo(22)
            make.top.equalTo(lettersTextView.snp.bottom).offset(25)
            make.trailing.equalToSuperview().inset(16)
        }
        contentView.addSubview(limitTextView)
        limitTextView.snp.makeConstraints{ make in
            make.top.equalTo(lettersTextView.snp.bottom).offset(54)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
        limitTextView.addSubview(limitTextField)
        limitTextField.snp.makeConstraints{ make in
            make.leading.equalTo(limitTextView).inset(8)
            make.top.equalTo(limitTextView.snp.top).inset(7)
            make.bottom.equalTo(limitTextView.snp.bottom).inset(7)
        }
        // 3 field 3
        contentView.addSubview(onlyCharectersLabel)
        onlyCharectersLabel.snp.makeConstraints{ make in
            make.width.equalTo(130)
            make.height.equalTo(20)
            make.top.equalTo(limitTextView.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(16)
        }
        contentView.addSubview(characterTextView)
        characterTextView.snp.makeConstraints{ make in
            make.top.equalTo(limitTextView.snp.bottom).offset(54)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
        characterTextView.addSubview(characterTextField)
        characterTextField.snp.makeConstraints{ make in
            make.leading.equalTo(characterTextView).inset(8)
            make.top.equalTo(characterTextView.snp.top).inset(7)
            make.bottom.equalTo(characterTextView.snp.bottom).inset(7)
            make.width.equalTo(200)
            make.height.equalTo(22)
        }
        
        // 4 field 4 LINK
        contentView.addSubview(linkLabel)
        linkLabel.snp.makeConstraints{ make in
            make.width.equalTo(34)
            make.height.equalTo(20)
            make.top.equalTo(characterTextView.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(16)
        }
        contentView.addSubview(linkTextView)
        linkTextView.snp.makeConstraints{ make in
            make.top.equalTo(characterTextView.snp.bottom).offset(54)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
        linkTextView.addSubview(linkTextField)
        linkTextField.snp.makeConstraints{ make in
            make.leading.equalTo(linkTextView).inset(8)
            make.top.equalTo(linkTextView.snp.top).inset(7)
            make.bottom.equalTo(linkTextView.snp.bottom).inset(7)
            make.width.equalTo(200)
            make.height.equalTo(22)
        }
        // 5 field 5  PASSWORDS
        contentView.addSubview(validationLabel)
        validationLabel.snp.makeConstraints{ make in
            make.width.equalTo(120)
            make.height.equalTo(20)
            make.top.equalTo(linkTextView.snp.bottom).offset(29)
            make.leading.equalToSuperview().inset(16)
        }
        contentView.addSubview(passwordTextView)
        passwordTextView.snp.makeConstraints{ make in
            make.top.equalTo(linkTextView.snp.bottom).offset(53)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
        passwordTextView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints{ make in
            make.leading.equalTo(passwordTextView).inset(8)
            make.top.equalTo(passwordTextView.snp.top).inset(7)
            make.bottom.equalTo(passwordTextView.snp.bottom).inset(7)
            make.width.equalTo(200)
            make.height.equalTo(22)
        }
        contentView.addSubview(validationRulesLabel)
        validationRulesLabel.snp.makeConstraints{ make in
            make.top.equalTo(passwordTextView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120)
        }
    }
    
    func defaultConfiguration() {
        self.view.backgroundColor = .white
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.backgroundTap))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 7.0
        let attributedString = NSMutableAttributedString(string: "Min length 8 characters.\nMin 1 digit,\nMin 1 lowercase,\nMin 1 capital required.\n")
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraph, range: NSMakeRange(0, attributedString.length))
        validationRulesLabel.attributedText = attributedString
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        var shouldMoveViewUp = false
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    @objc func backgroundTap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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

//MARK: extension ViewController
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == lettersTextField {
            let allowedCharacters = CharacterSet.decimalDigits.inverted
            let charSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: charSet)
        } else if textField == limitTextField {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            let lengthToAdd = updatedText.count
            charactersCounter.text = "\(lengthToAdd)/10"
            if lengthToAdd <= 10 {
                charactersCounter.textColor = .black
            } else {
                charactersCounter.textColor = .red
                charactersCounter.text = "10/10"
            }
            return lengthToAdd <= 10
            //} else if textField == linkTextField {
            // как вариант можно сделать маску для www.  а дальше как угодно.   Затем введеный текст проверяется на валидность. и открывается.  Причем тогдап можно и вторую точку проверить.
            //
            //            let link = linkTextField.text ?? ""
            //
            //            func isLinkValid(_ link : String) -> Bool {
            //                let linkTest = NSPredicate(format: "SELF MATCHES %@", linkRegex)
            //                return linkTest.evaluate(with: link)
            //            }
            //            print(isLinkValid(link))
            //
            //
            //
            //            //открывает окно через 5 сек
            ////            let delay : Double = 5.0
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
            //============
        } else if textField == passwordTextField {
            let password = passwordTextField.text ?? ""
            func isPasswordValid(_ password : String) -> Bool {
                let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
                return passwordTest.evaluate(with: password)
            }
            if isPasswordValid(password) == true {
                validationRulesLabel.textColor = .green
            } else {
                validationRulesLabel.textColor = .red
            }
        }
        return true
    }
    
    //TODO: проверить варианты ссылки с www.  и без.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == linkTextField {
            
//            func linkValidation(textField: UITextField) -> Bool {
                let link = linkTextField.text ?? ""
                func isLinkValid(_ link : String) -> Bool {
                    let linkTest = NSPredicate(format: "SELF MATCHES %@", linkRegex)
                    return linkTest.evaluate(with: link)
                }
                if isLinkValid(link) {
                    print("its valid LINK")
                } else {
                    print("NOT valid link")
                }
//            }
            //                return true
            //            }
            //
            //        }
            //        return true
        }
        return true
    }
    
    //открывает окно через 5 сек
    //            let delay : Double = 5.0
    //            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
    //                func startBrowser(_ sender: Any) {
    //                    if let urlString = self.linkTextField.text {
    //                        let url: URL?
    //                        if urlString.hasPrefix("http://") {
    //                            url = URL(string: urlString)
    //                        } else {
    //                            url = URL(string: "http://" + urlString)
    //                        }
    //                        if let url = url {
    //                            let sfViewController = SFSafariViewController(url: url)
    //                            self.present(sfViewController, animated: true, completion: nil)
    //                            print ("Now browsing in SFSafariViewController")
    //                        }
    //                    }
    //                }
    //                startBrowser(self.linkTextField)
    //            }
    //    }
    
    
    //MARK: constants
    enum Constants {
        enum LabelsSettings {
            static let lettersTextViewCornerRadius: CGFloat = 10
        }
        enum LabelsFonts {
            static let mainLabelFont = UIFont(name: "Rubik", size: 34)
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
            static let validationRulesLabelText = "Min length 8 characters,\nMin 1 digit,\nMin 1 lowercase,\nMin 1 capital required.\n"
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
    
    //MARK: keyboard
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    //    func validateUrl() -> Bool {
    //      let urlRegEx = "((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
    //      return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: self)
    //    }
}



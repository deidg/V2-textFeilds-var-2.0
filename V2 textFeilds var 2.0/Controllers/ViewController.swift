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
    
    
    // переменные с маленькой буквы!!!
    let noDigitsView = NoDigitsView()
    let counterView = CounterView()
    let maskView = MaskView()
    let linkView = LinkView()
    let passwordView = PasswordView()
    
    var activeTextField : UITextField? = nil
    
    let inputDigitRegex: String = "^([0-9]){5}$"
//    let linkRegex: String = "((?:http|https)://)?(?:www\\.)?(?:Www\\.)?(?:WWW\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
    let passwordRegex: String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-z\\d]{7,25}"
    let inputTextRegex: String = "^([a-zA-Z]{5})[-]([\\d]{5})$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnView()
        defaultConfiguration()
        
//        let noDigitsView = NoDigitsView

//        let NoDigitsView: UIView = NoDigitsView()
        

    }
    
    //MARK: additional views
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        scrollView.contentInsetAdjustmentBehavior = .automatic
        scrollView.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
//        scrollView = UIScrollView(frame: view.bounds)
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        return contentView
    }()
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height) //  + 100
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
    let noDigitsView2: UIView = {
       let noDigitsView = UIView()
        noDigitsView.backgroundColor = .cyan  //Constants.TextFields.viewBackgroundColor
        return noDigitsView
    }()

    
    //MARK:  2 field 2
    
    let counterView2: UIView = {
       let counterView = UIView()
        counterView.backgroundColor = .cyan  //Constants.TextFields.viewBackgroundColor
        return counterView
    }()

    
    //MARK:  3 field 3
    
    let maskView2: UIView = {
       let maskView = UIView()
        maskView.backgroundColor = .magenta //Constants.TextFields.viewBackgroundColor
        return maskView
    }()
    
    
    //MARK:  4 field 4  LINK
    
    let linkView2: UIView = {
       let linkView = UIView()
        linkView.backgroundColor = .magenta //Constants.TextFields.viewBackgroundColor
        return linkView
    }()
    

    
    //MARK:  5 field 5  PASSWORDS
    
    let passwordView2: UIView = {
       let passwordView = UIView()
        passwordView.backgroundColor = .magenta //Constants.TextFields.viewBackgroundColor
        return passwordView
    }()
    
    
    
//    let validationLabel: UILabel = {
//        let validationLabel = UILabel()
//        validationLabel.text = Constants.LabelsTexts.validationLabelText
//        validationLabel.backgroundColor = .white
//        validationLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
//        validationLabel.font = Constants.LabelsFonts.smallLabelFont
//        return validationLabel
//    }()
//    let passwordTextView: UIView = {
//        let passwordTextView = UIView()
//        passwordTextView.backgroundColor = Constants.TextFields.textFieldBackgroundColor
//        passwordTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
//        return passwordTextView
//    }()
//    let passwordTextField: UITextField = {
//        let passwordTextField = UITextField()
//        passwordTextField.placeholder = Constants.TextFields.passwordTextFieldPlaceholderText
//        passwordTextField.textColor = Constants.TextFields.textFieldTextColor
//        passwordTextField.font = Constants.TextFields.textFieldFont
//        return passwordTextField
//    }()
//    let validationRulesView: UIView = {
//        let validationRulesView = UIView()
//        return validationRulesView
//    }()
    
//    let validationMinLengthLabel: UILabel = {
//        let validationMinLengthLabel = UILabel()
//        validationMinLengthLabel.text = Constants.LabelsTexts.validationMinLengthLabelText
//        validationMinLengthLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
//        validationMinLengthLabel.font = Constants.LabelsFonts.smallLabelFont
//        return validationMinLengthLabel
//    }()
//    let validationDigitLabel: UILabel = {
//        let validationDigitLabel = UILabel()
//        validationDigitLabel.text = Constants.LabelsTexts.validationDigitLabelText
//        validationDigitLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
//        validationDigitLabel.font = Constants.LabelsFonts.smallLabelFont
//        return validationDigitLabel
//    }()
//    let validationLowerCaseLabel: UILabel = {
//        let validationLowerCaseLabel = UILabel()
//        validationLowerCaseLabel.text = Constants.LabelsTexts.validationLowerCaseLabelText
//        validationLowerCaseLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
//        validationLowerCaseLabel.font = Constants.LabelsFonts.smallLabelFont
//        return validationLowerCaseLabel
//    }()
//    let validationCapitalCaseLabel: UILabel = {
//        let validationCapitalCaseLabel = UILabel()
//        validationCapitalCaseLabel.text = Constants.LabelsTexts.validationCapitalCaseLabelText
//        validationCapitalCaseLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
//        validationCapitalCaseLabel.font = Constants.LabelsFonts.smallLabelFont
//        return validationCapitalCaseLabel
//    }()
//
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
        contentView.addSubview(noDigitsView)
        noDigitsView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(163)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        // 2 field 2
        contentView.addSubview(counterView)
        counterView.snp.makeConstraints{make in
            make.top.equalTo(noDigitsView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        // 3 field 3
        contentView.addSubview(maskView)
        maskView.snp.makeConstraints{make in
            make.top.equalTo(counterView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        
        // 4 field 4 LINK
        contentView.addSubview(linkView)
        linkView.snp.makeConstraints{make in
            make.top.equalTo(maskView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        
        
        // 5 field 5  PASSWORDS
        contentView.addSubview(passwordView)
        passwordView.snp.makeConstraints{make in
            make.top.equalTo(linkView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
    }
    
    func defaultConfiguration() {
        self.view.backgroundColor = .white
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.backgroundTap))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == lettersTextField {
//
//        } else if textField == limitTextField {
//            let currentText = textField.text ?? ""
//            guard let stringRange = Range(range, in: currentText) else { return false }
//            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//            let lengthToAdd = updatedText.count
//            charactersCounter.text = "\(lengthToAdd)/10"
//            if lengthToAdd <= 10 {
//                charactersCounter.textColor = .black
//            } else {
//                charactersCounter.textColor = .red
//                charactersCounter.text = "10/10"
//            }
//            return lengthToAdd <= 10
//        } else if textField == linkTextField {
//            //
//        } else if textField == passwordTextField {
   
//            if let text = passwordTextField.text,
//               let textRange = Range(range, in: text) {
//                let updatedText = text.replacingCharacters(in: textRange, with: string)
//
//
//                let decimalCharacters = CharacterSet.decimalDigits
//                let decimalRange = updatedText.rangeOfCharacter(from: decimalCharacters)
//                if decimalRange != nil {
//                    validationDigitLabel.textColor = .green
//                    print("Digits found")
//                } else {
//                    validationDigitLabel.textColor = .black
//                    print("Foo Digits")
//                }
//
//                let lowercaseLetters = CharacterSet.lowercaseLetters
//                let lowercaseLettersRange = updatedText.rangeOfCharacter(from: lowercaseLetters)
//                if lowercaseLettersRange != nil {
//                    validationLowerCaseLabel.textColor = .green
//                    print("lower found")
//                } else {
//                    validationLowerCaseLabel.textColor = .black
//                    print("Foo lower")
//                }
//
//                let capitalizedLetters = CharacterSet.uppercaseLetters
//                let capitalizedLettersRange = updatedText.rangeOfCharacter(from: capitalizedLetters)
//                if capitalizedLettersRange != nil {
//                    validationCapitalCaseLabel.textColor = .green
//                    print("capitalized found")
//                } else {
//                    validationCapitalCaseLabel.textColor = .black
//                    print("Foo capitalized")
//                }
//
//                if updatedText.count >= 8 {
//                    validationMinLengthLabel.textColor = .green
//                } else {
//                    validationMinLengthLabel.textColor = .black
//                }
//            }
//        }
//        return true
//    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == linkTextField {
//
//            let link = linkTextField.text ?? ""
//            func isLinkValid(_ link : String) -> Bool {
//                let linkTest = NSPredicate(format: "SELF MATCHES %@", linkRegex)
//                return linkTest.evaluate(with: link)
//            }
//            if isLinkValid(link) {
//                print("its valid LINK")
//
//                let delay : Double = 2.0 // 5.0
//                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                    func startBrowser(_ sender: Any) {
//                        if let urlString = self.linkTextField.text {
//                            let url: URL?
//                            if urlString.hasPrefix("http://") {
//                                url = URL(string: urlString)
//                            } else {
//                                url = URL(string: "http://" + urlString)
//                            }
//                            if let url = url {
//                                let sfViewController = SFSafariViewController(url: url)
//                                self.present(sfViewController, animated: true, completion: nil)
//                                print ("Now browsing in SFSafariViewController")
//                            }
//                        }
//                    }
//                    startBrowser(self.linkTextField)
//                }
//            } else {
//                print("NOT valid link")
//            }
//        }
//        return true
//    }
    
    //MARK: constants
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}


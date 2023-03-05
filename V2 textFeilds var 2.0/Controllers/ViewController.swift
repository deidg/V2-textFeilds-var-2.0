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
    
    let noDigitsView = NoDigitsView()
    let counterView = CounterView()
    let maskView = MaskView()
    let linkView = LinkView()
    let passwordView = PasswordView()
    
    var activeTextField : UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnView()
        defaultConfiguration()
        
        linkView.delegate = self
    }
    
    //MARK: additional views
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        scrollView.contentInsetAdjustmentBehavior = .automatic
        scrollView.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollView = UIScrollView(frame: view.bounds)
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

//MARK: extension ViewController
extension ViewController: LinkViewDelegate {
    
    func openURL(url: URL) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let sfViewController = SFSafariViewController(url: url, configuration: config)
        self.present(sfViewController, animated: true)
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        let sfVC = self
        sfVC.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    //MARK: constants
    enum Constants {
        enum LabelsFonts {
            static let mainLabelFont = UIFont(name: "Rubik-Medium", size: 34)
        }
        enum LabelsTexts {
            static let mainTitleLabeText = "Text Fields"
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}



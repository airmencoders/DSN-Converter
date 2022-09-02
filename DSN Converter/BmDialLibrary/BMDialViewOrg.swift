//
//  PhoneDigitOrg.swift
//  DSN Converter
//
//  Created by https://github.com/IamSaurav/BMDialPad
//

import UIKit
import AudioToolbox
import PMAlertController
var itsSevenGlobal = false
class BMDialViewOrg: UIView, UITextFieldDelegate {
    
    
    
    var callTapped: ((String)->())?
    var CallButtonColor = UIColor.systemGreen
    var TextColor = UIColor(named: "DarkMode")
    var BackgrounColor = UIColor.systemGray4
    var CursorColor = UIColor.systemBlue

//    var CallButtonColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
//    var TextColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
//    var BorderColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
//    var CursorColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
    
    private var padView: UIView?
    private var textField: UITextField?
    private var deleteBtnTimer: Timer?
    private var numberTimer: Timer?
    
    func setupDialPad(frame: CGRect)
    {
        self.frame = frame
        setupUI()
    }
    
    private func setupUI() -> Void {
        var width = self.frame.size.width/5
        width = width <= 100 ? width : 100
        let requiredKeyPadHeight = width * 6.9
        textField = UITextField()
        textField?.tintColor = CursorColor
        let gap = self.frame.size.width/5
        textField?.frame = CGRect.init(x: gap/2, y: (frame.size.height - requiredKeyPadHeight - 100)/2, width: self.frame.size.width-gap, height: 130)
        textField?.minimumFontSize = 2
        textField?.adjustsFontSizeToFitWidth = true
        textField?.textAlignment = NSTextAlignment.center
        textField?.textColor = TextColor;
        textField?.inputView = UIView.init()
        
        
        let backspaceButton = UIButton.init(type: UIButton.ButtonType.system)
        let image = UIImage(named:"backSpace")?.withRenderingMode(.alwaysTemplate)
        backspaceButton.tintColor = TextColor
        backspaceButton.setBackgroundImage(image, for: UIControl.State.normal)
        backspaceButton.addTarget(self, action: #selector(backspaceTapped), for: UIControl.Event.touchUpInside)
        

        
        
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressedDeleteBtn))
        longPress.minimumPressDuration = 0.2
        backspaceButton.addGestureRecognizer(longPress)
        backspaceButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        textField?.rightView = backspaceButton
        
        
        let leftView = UIView.init()
        leftView.frame = CGRect.init(x: 0, y: 0, width: 10, height: 0)
        leftView.backgroundColor = UIColor.clear
        textField?.leftView = leftView
        textField?.leftViewMode = .always
        textField?.rightViewMode = UITextField.ViewMode.never
        textField?.font = UIFont.init(name: "HelveticaNeue-Thin", size: 55)
        addSubview(textField!)
        textField?.sendActions(for: .allEvents)
        textField?.addTarget(self, action: #selector(textFieldChanged), for:.allEvents)
        padView = UIView()
        padView?.frame = CGRect.init(x: 0, y: frame.size.height - requiredKeyPadHeight, width: self.frame.size.width, height: requiredKeyPadHeight)
        self.addSubview(padView!)
        
        let digitsList = defaultDigits()
        
        let xGap: CGFloat = (self.frame.size.width - (width * 3))/4
        var x: CGFloat = xGap
        var y: CGFloat = 0
        let yGap = xGap - 24
        let maxX = (3 * xGap + 2 * width )
        for i in 0 ..< digitsList.count {
            let digit = digitsList[i]
            let row = Float(i / 3).rounded(.towardZero)
            y = CGFloat(row) * (width + yGap)
            let frame = CGRect.init(x: x, y: y, width: width, height: width)
            let btn = createButton(frame: frame)
            btn.tag = i + 1000
            btn.setAttributedTitle(buttonAttTitle(number: digit.number!, letter: digit.letters!), for: UIControl.State.normal)
            addLongPressRecogniser(btn: btn)
            x +=  xGap + width
            x = x > maxX ? xGap : x
        }
        
        let callBtn: UIButton = UIButton()
        callBtn.addTarget(self, action: #selector(call), for: UIControl.Event.touchUpInside)
        callBtn.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Thin", size: 20)
        callBtn.setImage(UIImage.init(named: "phoneBar"), for: UIControl.State.normal)
        callBtn.backgroundColor = CallButtonColor
        callBtn.frame = CGRect.init(x: ((padView?.frame.size.width)!-width)/2, y: y + width + yGap, width: width, height: width)
        callBtn.layer.cornerRadius = callBtn.frame.width/2
        callBtn.layer.masksToBounds = true
        padView?.addSubview(callBtn)
        
        
    }
    
    private func createButton(frame: CGRect) -> UIButton {
        let btn: UIButton = UIButton.init(type: UIButton.ButtonType.roundedRect)
        btn.addTarget(self, action: #selector(buttonTapped), for: UIControl.Event.touchUpInside)
        btn.frame = frame;
        btn.titleLabel?.textAlignment = NSTextAlignment.center
        btn.titleLabel?.numberOfLines = 0
        btn.layer.cornerRadius = frame.width/2
        btn.layer.borderColor = BackgrounColor.cgColor
//        btn.layer.backgroundColor = BackgrounColor.cgColor
        btn.layer.borderWidth = 2
        btn.layer.masksToBounds = true
        self.padView?.addSubview(btn)
        return btn
    }
    
    @objc private func buttonTapped(btn: UIButton) {
        let index = btn.tag - 1000
        let digit = defaultDigits()[index]
        textField?.insertText(digit.number!)
        textField?.layoutIfNeeded()
        textField?.tintColor = .clear
        textField?.rightViewMode = (textField?.text?.isEmpty)! ? .never : .always
        let soundNo = 1220 + index
        AudioServicesPlaySystemSound(SystemSoundID(soundNo))
        
        
        //Adds "-" to the textfield
        if textField?.text?.count == 7 {
            // If the text does not contain "-" Do nothing
            if ((textField?.text?.contains("-")) == false) {

               //
                print("- No Here")
                itsSevenGlobal = true
                print("ITs 7")
                let phone = textField?.text!
                textField?.text!.insert("-", at: (phone?.index((phone?.startIndex)!,offsetBy:3))!);
            }
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Its hahhpeinig")
        let maxLength = 8
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString

        return newString.length <= maxLength
    }
    
    @objc private func call(btn: UIButton) {
        callTapped?((textField?.text)!)
    }
    
    @objc private func longPressedDeleteBtn(gesture: UILongPressGestureRecognizer) {
        if(gesture.state == .began){
            deleteBtnTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (t) in
                self.delete()
            })
        }
        else if (gesture.state == .ended || gesture.state == .cancelled || gesture.state == .failed){
            deleteBtnTimer?.invalidate()
        }
    }
    
    @objc private func backspaceTapped(btn: UIButton) {
        print("BackPRess")
        let color = textField?.tintColor
        delete()
        if(textField?.text?.isEmpty)!{
            textField?.tintColor = .clear
        }
        else{
            textField?.tintColor = color
        }
    }
    
    @objc private func longPressedButton(gesture: UILongPressGestureRecognizer) {
        if(gesture.state == .began){
            let btn = gesture.view as! UIButton
            let index = btn.tag - 1000
            let digit = defaultDigits()[index]
            var subList = Array((digit.letters?.characters)!)
            var i = 0
            numberTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (t) in
                if(subList.count > i){
                    let ch = subList[i]
                    if(i > 0){
                        self.delete()
                    }
                    self.textField?.insertText(String.init(ch))
                    self.textField?.layoutIfNeeded()
                    i += 1
                }
                else{
                    self.delete()
                    i = 0
                }
            })
        }
        else if(gesture.state == .ended || gesture.state == .failed){
            textField?.rightViewMode = (textField?.text?.isEmpty)! ? .never : .always
            numberTimer?.invalidate()
        }
    }


    func delete()  {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
            //Adds the cursor position to the end of the TextField
            let endPosition: UITextPosition = self.textField!.endOfDocument
            self.textField?.selectedTextRange = self.textField?.textRange(from: endPosition, to: endPosition)
            self.textField?.deleteBackward()
            print(self.textField?.text?.count as Any)

        }, completion: { (finished: Bool) in
            self.textField?.rightViewMode = (self.textField?.text?.isEmpty)! ? .never : .always
        })
    }
    func buttonAttTitle(number: String, letter: String) -> NSAttributedString {
        let numberAtt = NSMutableAttributedString.init(string: number, attributes: [NSAttributedString.Key.foregroundColor : TextColor!, NSAttributedString.Key.font : UIFont.init(name: "HelveticaNeue-Thin", size: 40)!])
        if(!letter.isEmpty){
            let letterAtt = NSAttributedString.init(string: "\n" + letter, attributes: [NSAttributedString.Key.foregroundColor : TextColor!, NSAttributedString.Key.font : UIFont.init(name: "HelveticaNeue-Thin", size: 13)!])
            numberAtt.append(letterAtt)
        }
        return numberAtt
    }
    
    func addLongPressRecogniser(btn: UIButton) {
        let gesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer()
        gesture.minimumPressDuration = 0.3
        gesture.addTarget(self, action: #selector(longPressedButton))
        btn.addGestureRecognizer(gesture)
    }
    
    private func defaultDigits() -> [PhoneDigitOrg] {
        var digitList: [PhoneDigitOrg] = [PhoneDigitOrg]()
        digitList.append(PhoneDigitOrg.init(number: "1", letters: ""))
        digitList.append(PhoneDigitOrg.init(number: "2", letters: "ABC"))
        digitList.append(PhoneDigitOrg.init(number: "3", letters: "DEF"))
        digitList.append(PhoneDigitOrg.init(number: "4", letters: "GHI"))
        digitList.append(PhoneDigitOrg.init(number: "5", letters: "JKL"))
        digitList.append(PhoneDigitOrg.init(number: "6", letters: "MNO"))
        digitList.append(PhoneDigitOrg.init(number: "7", letters: "PQRS"))
        digitList.append(PhoneDigitOrg.init(number: "8", letters: "TUV"))
        digitList.append(PhoneDigitOrg.init(number: "9", letters: "WXYZ"))
        digitList.append(PhoneDigitOrg.init(number: "*", letters: ""))
        digitList.append(PhoneDigitOrg.init(number: "0", letters: "+"))
        digitList.append(PhoneDigitOrg.init(number: "#", letters: ""))
        return digitList
    }
    
    @objc func textFieldChanged(field: UITextField)  {
        if (field.text?.isEmpty)! {
            textField?.tintColor = UIColor.clear
        }else{
            textField?.tintColor = CursorColor
        }
        self.textField?.rightViewMode = (self.textField?.text?.isEmpty)! ? .never : .always
    }
    
    func setText(text: String) {
        textField?.text = text
    }
    
    func text() -> String? {
        return textField?.text
    }
    
}

extension UITextField {
    func setCursor(position: Int) {
        let position = self.position(from: beginningOfDocument, offset: position )!
        selectedTextRange = textRange(from: position, to: position)
    }
}

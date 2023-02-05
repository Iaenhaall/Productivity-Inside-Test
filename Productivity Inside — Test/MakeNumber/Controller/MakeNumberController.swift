//
//  MakeNumberController.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 31.01.2023.
//

import UIKit

class MakeNumberController: UIViewController {
    private var makeNumberView: MakeNumberView! {
        guard isViewLoaded else { return nil }
        return (view as! MakeNumberView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        makeNumberView.configure(with: self)
    }
    
    override func viewLayoutMarginsDidChange() {
        makeNumberView.changeConstraints()
    }
    
    @IBAction func enterNumberButtonTapped(_ sender: UIButton) {
        // Не передает введенное пользователем число, так как оно не используется на следующих ViewController'ах.
        let computersGuessViewController = self.storyboard?.instantiateViewController(withIdentifier: "ComputerGuessController") as! ComputerGuessController
        UIApplication.shared.connectedScenes.compactMap{($0 as? UIWindowScene)?.keyWindow}.first!.rootViewController = computersGuessViewController
    }
}


extension MakeNumberController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return UITextField.allowOnlyIntsFrom1To100(in: textField,
                                                   shouldChangeCharactersIn: range,
                                                   replacementString: string,
                                                   setEntryButtonToEnabled: makeNumberView.setEnterNumberButtonState(toEnabled:))
    }
}

//
//  UIViewControllerExtensions.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 02.02.2023.
//

import UIKit

extension UIViewController {
    /// Закрывает клавиатуру по одиночному нажатию на любое место ViewController'а.
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

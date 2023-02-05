//
//  StartGameController.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 31.01.2023.
//

import UIKit

class StartGameController: UIViewController {
    @IBAction func startNewGameButtonTapped(_ sender: UIButton) {
        let makeNumberViewController = self.storyboard?.instantiateViewController(withIdentifier: "MakeNumberController") as! MakeNumberController
        UIApplication.shared.connectedScenes.compactMap{($0 as? UIWindowScene)?.keyWindow}.first!.rootViewController = makeNumberViewController
    }
}

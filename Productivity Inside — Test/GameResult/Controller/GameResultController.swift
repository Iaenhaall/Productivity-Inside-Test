//
//  GameResultController.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 02.02.2023.
//

import UIKit

/// Экран с результатом игры.
class GameResultController: UIViewController {
    internal var computerTries = 0
    internal var userTries = 0
    
    private var gameResultView: GameResultView! {
            guard isViewLoaded else { return nil }
            return (view as! GameResultView)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var result = ""
        if userTries == computerTries {
            result = "The game has played in a draw"
        } else {
            result = userTries > computerTries ? "You Lose" : "You Win"
        }
        
        gameResultView.configure(userTries: userTries, computerTries: computerTries, result: result)
    }
    
    override func viewLayoutMarginsDidChange() {
        gameResultView.changeConstraints()
    }
    
    @IBAction func mainMenuButtonTapped(_ sender: UIButton) {
        let startGameViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartGameController") as! StartGameController
        UIApplication.shared.connectedScenes.compactMap{($0 as? UIWindowScene)?.keyWindow}.first!.rootViewController = startGameViewController
    }
}

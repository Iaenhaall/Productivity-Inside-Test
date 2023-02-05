//
//  ComputerGuessController.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 01.02.2023.
//

import UIKit

class ComputerGuessController: UIViewController {
    private var computerGuessModel = NumberGuessingByComputer(inRange: 1...100)
    private var computerGuessView: ComputerGuessView! {
        guard isViewLoaded else { return nil }
        return (view as! ComputerGuessView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessNumber()
    }
    
    override func viewLayoutMarginsDidChange() {
        computerGuessView.changeConstraints()
    }
    
    /// Запускает процесс угадывания компьютером числа пользователя и обновляет состояние игры.
    /// - Parameter currentState: Результат сравнения загаданного пользователем числа и числа предложенного компьютером.
    private func guessNumber(currentState: GuessingState? = nil) {
        if computerGuessModel.guess(currentState: currentState) {
            showResult()
        }
        computerGuessView.updateGameState(computerTries: computerGuessModel.tries,
                                          guessedNumber: computerGuessModel.number!,
                                          disableGreaterButton: computerGuessModel.range.upperBound == computerGuessModel.number,
                                          disableLessButton: computerGuessModel.range.lowerBound == computerGuessModel.number)
    }
    
    /// Осуществляет переход к экрану отгадывания числа игроком.
    private func showUserGuessViewController(alertAction: UIAlertAction) {
        let userGuessTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserGuessController") as! UserGuessController
        userGuessTableViewController.computerTries = computerGuessModel.tries
        UIApplication.shared.connectedScenes.compactMap{($0 as? UIWindowScene)?.keyWindow}.first!.rootViewController = userGuessTableViewController
    }
    
    /// Выводит уведомление с загаданным пользователем числом и количеством попыток затраченных компьютером на его отгадывание.
    /// Нажатие на кнопку "OK" осуществляет переход к экрану отгадывания числа игроком.
    private func showResult() {
        let alert = UIAlertController(title: "Your number is \(computerGuessModel.number!)",
                                      message: "Computer guessed your number in \(computerGuessModel.tries) try(ies).",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: showUserGuessViewController))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func greaterButtonTapped(_ sender: UIButton) {
        guessNumber(currentState: .greater)
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        guessNumber(currentState: .equal)
    }
    
    @IBAction func lessButtonTapped(_ sender: UIButton) {
        guessNumber(currentState: .less)
    }
}

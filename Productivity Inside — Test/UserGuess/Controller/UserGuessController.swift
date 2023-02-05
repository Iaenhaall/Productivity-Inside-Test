//
//  UserGuessController.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 01.02.2023.
//

import UIKit

class UserGuessController: UIViewController {
    internal var computerTries = 0
    private var userInput = ""
    private var isGuessButtonEnabled = false
    private var userGuessModel = NumberGuessingByUser(range: 1...100)
    private var userGuessView: UserGuessView! {
        guard isViewLoaded else { return nil }
        return (view as! UserGuessView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        userGuessView.configure(with: self)
    }
    
    override func viewLayoutMarginsDidChange() {
        // Обновляет таблицу для отображения нужной ячейки после изменения ориентации интерфейса.
        userGuessView.tableView.reloadData()
    }
    
    /// Осуществляет переход к экрану с результатом игры.
    private func showGameResultViewController(alertAction: UIAlertAction) {
        let gameResultViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameResultController") as! GameResultController
        gameResultViewController.computerTries = computerTries
        gameResultViewController.userTries = userGuessModel.tries
        UIApplication.shared.connectedScenes.compactMap{($0 as? UIWindowScene)?.keyWindow}.first!.rootViewController = gameResultViewController
    }
}


extension UserGuessController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier = ""
        if UIApplication.shared.connectedScenes.compactMap({($0 as? UIWindowScene)?.keyWindow}).first?.windowScene?.interfaceOrientation.isLandscape ?? false {
            identifier = "LandscapeUserGuessTableViewCell"
        } else {
            identifier = "PortraitUserGuessTableViewCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BaseUserGuessTableViewCell
        cell.setDelegate(self)
        cell.setTries(count: userGuessModel.tries + 1)
        cell.setUser(input: userInput)
        cell.setGuessButtonState(toEnabled: isGuessButtonEnabled)
        if let state = userGuessModel.state { cell.setComputer(hint: state) }
        
        return cell
    }
}


extension UserGuessController: UserGuessControllerDelegate {
    func updateUser(input: String) {
        userInput = input
    }
    
    func updateGuessButtonState(toEnabled isEnabled: Bool) {
        isGuessButtonEnabled = isEnabled
    }
    
    func checkUserInput() {
        guard let userNumber = Int(userInput) else { return }
        
        if userGuessModel.compareComputerNumber(with: userNumber) == .equal {
            let alert = UIAlertController(title: "Computer number is \(userGuessModel.number)",
                                          message: "You guessed the computer number in \(userGuessModel.tries) try(ies).",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler: showGameResultViewController))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // Обновляет количество попыток пользователя и выводит ответ компьютера без перезагрузки всей таблицы.
        // Контроллер гарантирует, что в таблице всего одна ячейка.
        if let state = userGuessModel.state,
           let cell = userGuessView.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? BaseUserGuessTableViewCell {
            cell.setTries(count: userGuessModel.tries + 1)
            cell.setComputer(hint: state)
        }
    }
}


extension UserGuessController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Контроллер гарантирует, что в таблице всего одна ячейка.
        if let cell = userGuessView.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? BaseUserGuessTableViewCell {
            return UITextField.allowOnlyIntsFrom1To100(in: textField,
                                                       shouldChangeCharactersIn: range,
                                                       replacementString: string,
                                                       setEntryButtonToEnabled: cell.setGuessButtonState(toEnabled:),
                                                       delegate: self)
        }

        return false
    }
}

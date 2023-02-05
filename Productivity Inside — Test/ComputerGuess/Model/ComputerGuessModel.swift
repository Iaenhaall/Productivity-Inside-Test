//
//  ComputerGuessModel.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 04.02.2023.
//

import Foundation

/// Модель данных для угадывания компьютером числа, загаданного пользователем.
struct NumberGuessingByComputer {
    private(set) var tries = 0
    private(set) var range: ClosedRange<Int>
    private(set) var number: Int? = nil
    private(set) var state: GuessingState? = nil
    
    init(inRange range: ClosedRange<Int>) {
        self.range = range
    }
    
    /// Угадывает число пользователя путем выбора среднего числа из заданного диапазона.
    /// Таким образом, число из диапазона 1...100 будет отгадано максимум за 7 попыток.
    /// - Parameter newState: Результат сравнения загаданного пользователем числа и числа предложенного компьютером.
    /// - Returns: True, если компьютер отгадал число пользователя со 100% вероятностью (подтверждения пользователя о равенстве числе не требуется), в противном случае — false.
    mutating func guess(currentState newState: GuessingState? = nil) -> Bool {
        if state == .equal { return true }
        if number == nil && newState != nil { return false }
        
        state = newState
        switch state {
        case .greater:
            if number == range.upperBound { return false }
            range = (number! + 1)...range.upperBound
        case .less:
            if number == range.lowerBound { return false }
            range = range.lowerBound...(number! - 1)
        case .equal:
            return true
        case .none:
            if number != nil { return false }
        }
        
        number = (range.upperBound - range.lowerBound) / 2 + range.lowerBound
        tries += 1
        
        if range.lowerBound == range.upperBound {
            state = .equal
            return true
        }
        
        return false
    }
}

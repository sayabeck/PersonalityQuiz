//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран
    @IBOutlet weak var labelWithEmoji: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    var answers: [Answer] = []
    var animals: [Animal] = []
    var animal: Animal {
        whichAnimal()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        selectedAnimals(with: answers)
        
        labelWithEmoji.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
    
    private func selectedAnimals(with answers: [Answer]) {
        answers.forEach { animals.append($0.animal) }
        print(animals)
    }
    
    // если есть ответы с равным количеством, то приоритет самому первому выбору юзера
    private func whichAnimal() -> Animal {
        let mappedAnimals = animals.map { ($0, 1) }
        let animalCounts = Dictionary(mappedAnimals, uniquingKeysWith: +)
        
        var number = 0
        var mostPickedAnimal = animals.first!
        for animal in animalCounts {
            if animal.value > number {
                number = animal.value
                mostPickedAnimal = animal.key
            }
        }
        
        return mostPickedAnimal
        
    }
}

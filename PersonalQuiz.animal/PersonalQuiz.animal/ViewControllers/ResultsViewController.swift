//
//  ResultsViewController.swift
//  PersonalQuiz.animal
//
//  Created by Таня Кожевникова on 13.11.2024.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
   
    var answers : [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        updateResult()
    }
}

//MARK: - Private Methods
extension ResultsViewController {
    
    private func updateResult() {
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = answers.map { $0.type }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequentAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequentAnimal)
    }
    
    private func updateUI(with animalType: AnimalType) {
        animalTypeLabel.text = "Вы - \(animalType.rawValue )!"
        descriptionLabel.text = animalType.definition
    }
}

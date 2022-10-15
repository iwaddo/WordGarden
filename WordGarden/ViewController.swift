//
//  ViewController.swift
//  WordGarden
//
//  Created by Ian Waddington on 12/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var wordsMissedLabel: UILabel!
    @IBOutlet weak var wordsInGameLabel: UILabel!
    
    
    @IBOutlet weak var wordBeingRevealedLabel: UILabel!
    @IBOutlet weak var guessedLetterTextField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameStatusMessageLabel: UILabel!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // enables or disables the guess letter button based on the text field being empty or not, used here to set the defualt to disabled.
        let text = guessedLetterTextField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
    }
    
    func updateUIAfterGuess() {
        // This dismisses the keyboard
        guessedLetterTextField.resignFirstResponder()
        guessedLetterTextField.text = ""
        guessLetterButton.isEnabled = false 
    }
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        // dismiss the keyboard
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        // enables or disables the guess letter button based on the text field being empty or not
        sender.text = String(sender.text?.last ?? " ").trimmingCharacters(in: .whitespaces)
        guessLetterButton.isEnabled = !(sender.text!.isEmpty)
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        // dismiss the keyboard
        updateUIAfterGuess()
        
    }
    
    
}


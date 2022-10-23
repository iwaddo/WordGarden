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
    
    var wordsToGuess = ["SWIFT", "DOG", "CAT"]
    var currentWordIndex = 0
    var wordToGuess = ""
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var wordsGuessedCount = 0
    var wordsMissedCount = 0
    var guessCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // enables or disables the guess letter button based on the text field being empty or not, used here to set the defualt to disabled.
        let text = guessedLetterTextField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
        wordToGuess = wordsToGuess[currentWordIndex]
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
        updateGameStatusLabels()
    }
    
        func updateUIAfterGuess() {
        // This dismisses the keyboard
        guessedLetterTextField.resignFirstResponder()
        guessedLetterTextField.text = ""
        guessLetterButton.isEnabled = false 
    }
    
    func formatRevealWord() {
        // format and show revealedWord in wordbeingRevealedLabel to include new guess
        var revealedWord = ""
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + String(letter) + " "
            } else {
                revealedWord = revealedWord + "_ "
            }
        }
        revealedWord = revealedWord.trimmingCharacters(in: .whitespaces)
        wordBeingRevealedLabel.text = revealedWord

    }
    
    func updateAfterWinOrLose() {
        // what do we do if game is over?
        // - increment currentWordIndex by 1
        // - disable guessALetterTextField
        // - disable guessALetterButton
        // - set PlayAgainButton .isHidden to false
        // - update all labels at the top of the screen
        
        currentWordIndex += 1
        guessedLetterTextField.isEnabled = false
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = false

        updateGameStatusLabels()
    }

    func updateGameStatusLabels() {
        // update labels at top of screen
        wordsGuessedLabel.text = "Words Guessed: \(wordsGuessedCount)"
        wordsMissedLabel.text = "Words Missed: \(wordsMissedCount)"
        wordsRemainingLabel.text = "Words to Guess: \(wordsToGuess.count - (wordsGuessedCount + wordsMissedCount))"
        wordsInGameLabel.text = "Words in Game: \(wordsToGuess.count)"
    }
    
    func guessALetter() {
        // get current letter guessed and add it to all lettersGuessed
        let currentLetterGuessed = guessedLetterTextField.text!
        lettersGuessed = lettersGuessed + currentLetterGuessed
        
        formatRevealWord()
        
        // update image, if needed, and keep track of wrong guesses
        if wordToGuess.contains(currentLetterGuessed) == false {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        // update gameStatusMessageLabel
        guessCount += 1
//        var guesses = "Guesses"
//        if guessCount == 1{
//            guesses = "Guess"
//        }
        // using the ternary operator
        let guesses = (guessCount == 1 ? "Guess" : "Gueses")
        gameStatusMessageLabel.text = "You've Made \(guessCount) \(guesses)"
        
        // After each guess, check to see if two things happen:
        // 1) The user won the game
        // - all letters are guessed, so there are no more underscores in wordBeingRevealed.text
        // - handle game over
        
        if wordBeingRevealedLabel.text!.contains("_") == false {
            gameStatusMessageLabel.text = "You've guessed it!\nIt took you \(guessCount) guesses to guess the word"
            wordsGuessedCount += 1
            updateAfterWinOrLose()
        } else if wrongGuessesRemaining == 0 {
            gameStatusMessageLabel.text = "So sorry! You're all out of guesses"
            wordsMissedCount += 1
            updateAfterWinOrLose()
        }
        
        // check to see if you've played all the words. If so, update the message indicating the player can restart the entire game.
        if currentWordIndex == wordsToGuess.count {
            gameStatusMessageLabel.text! += "\n\nYou've tried all of the words! Restart from the beginning?"
        }
        
    }
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        // dismiss the keyboard
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        // if all words have been guessed and you selct playAgain, then restart all games as if the app had been restarted
        if currentWordIndex == wordToGuess.count {
            currentWordIndex = 0
            wordsGuessedCount = 0
            wordsMissedCount = 0
        }
        
        
        // hide playAgainButton
        // enable letterGuessedtextField
        // disable guessALetterButton - it alreday is, though
        // currentWord should be set to next word
        // set wordbeingRevealed.text to underscores separated by spaces
        // set wrongGuessRemaining to maxNumberOfWrongGuesses
        // set GuessCount = 0
        // set flowerImageView to flower8
        // clear out lettersGuessed, so new word restarts with no letters guessed, or = ""
        // set gameStatusMessageLabel.text to "You've Made 0 Guesses"
        
        playAgainButton.isHidden = true
        guessedLetterTextField.isEnabled = true
        guessLetterButton.isEnabled = false // don't turn turn true until a character is in the text field
        wordToGuess = wordsToGuess[currentWordIndex]
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        // create word with underscores, one for each letter
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
        guessCount = 0
        flowerImageView.image = UIImage(named: "flower\(maxNumberOfWrongGuesses)")
        lettersGuessed = ""
        updateGameStatusLabels()
        gameStatusMessageLabel.text = "You've Made 0 Guesses"
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        // enables or disables the guess letter button based on the text field being empty or not
        sender.text = String(sender.text?.last ?? " ").trimmingCharacters(in: .whitespaces)
        guessLetterButton.isEnabled = !(sender.text!.isEmpty)
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        // dismiss the keyboard
        updateUIAfterGuess()
        
    }
    
    
}


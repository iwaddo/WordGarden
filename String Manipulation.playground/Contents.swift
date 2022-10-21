import UIKit

var myName = "Gallagher"
var smallerString = "laugh"

// contains
if myName.contains(smallerString) {
    print("\(myName) contains \(smallerString)")
} else {
    print("There is no \(smallerString) in \(myName)")
}

// hasPrefix + hasSuffix

var occupation = "Real Estate Developer"
var searchString = "Swift"

print("\nPREFIX SEARCH")

if occupation.hasPrefix(searchString) {
    print("You're hired!")
} else {
    print("No job for you")
}

print("\nSUFFIX SEARCH")
occupation = "iOS Hater"
searchString = "Developer"

if occupation.hasSuffix(searchString) {
    print("You're hired! We need more \(occupation)s.")
} else {
    print("No job for you. No one needs any \(occupation)s.")
}

// .removelast()
print("\nREMOVE")
var bandName = "The White Stripes"
let lastChar = bandName.removeLast()
print("After we remove \(lastChar) the band is just \(bandName).")

// .removeFirst(k: Int)
print("\nREMOVE FIRST #")
var person = "Dr. Nick"
let title = "Dr."
person.removeFirst(title.count+1)
print(person)

// .replacingOccurences(of: with:)
print("\nREPLACING OCCURANCES OF ")

// 123 James St.
// 123 James St
// 123 James Street

var address = "123 James St."
var streetString = "St."
var replacementString = "Street"

var standardAddress = address.replacingOccurrences(of: streetString, with: replacementString)
print(standardAddress, address)

// What would you do if you has 123 St. James St.? See exrecises after chapter....

// Iterate Through a String
print("\nBACKWARDS STRING")

var name = "Gallaugher"
var backwardsName = ""
for letter in name {
    print(letter)
}

for letter in name {
    backwardsName = String(letter) + backwardsName
}

print("\(name), \(backwardsName)")

// capitalisation
print("\nPLAYING WITH CAPS")
var crazyCaps = "SwIFt DeVEloPEr"
var uppercased = crazyCaps.uppercased()
var lowercased = crazyCaps.lowercased()
var capitalised = crazyCaps.capitalized

print(crazyCaps)
print(uppercased, lowercased, capitalised)
print(crazyCaps)
 
var wordToGuess = "SWIFT UI Developer"
var revealedWord = ""

// letter is not used in the below so replaced with an underscore
// for letter in wordToGuess {
for _ in wordToGuess {
    revealedWord = "_ " + revealedWord
}
// revealedWord = revealedWord.trimmingCharacters(in: .whitespaces)
revealedWord.removeLast()
print("The word to guess is \(wordToGuess) the revealved word is \"\(revealedWord)\"")

// Create a String fron a repeat
print("\nREPLACE REPEATING")
revealedWord = "_" + String(repeating: " _", count: wordToGuess.count-1)
print("Using repeating String, the word to guess is \(wordToGuess) the revealved word is \"\(revealedWord)\"")

// Challenge: Reveal Word After Letter Guess
print("\nReveal Word After Letter Guess")
var lettersGuessed = "SQFTXW"
wordToGuess = "STARWARS"
revealedWord = ""
for letter in wordToGuess {
    if lettersGuessed.contains(letter) {
        revealedWord = revealedWord + String(letter) + " "
    } else {
        revealedWord = revealedWord + "_ "
    }
}
revealedWord = revealedWord.trimmingCharacters(in: .whitespaces)
print("The revealed word is \"\(revealedWord)\"")

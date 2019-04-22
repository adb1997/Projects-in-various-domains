

import random

WORDLIST_FILENAME = "words.txt"

def loadWords():
    """
    Returns a list of valid words. Words are strings of lowercase letters.
 
    """
    print("Loading word list from file...")
    # inFile: file
    inFile = open(WORDLIST_FILENAME, 'r')
    # line: string
    line = inFile.readline()
    # wordlist: list of strings
    wordlist = line.split()
    print("  ", len(wordlist), "words loaded.")
    return wordlist

def chooseWord(wordlist):
    """
    wordlist (list): list of words (strings)

    Returns a word from wordlist at random
    """
    return random.choice(wordlist)


wordlist = loadWords()

def isWordGuessed(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: boolean, True if all the letters of secretWord are in lettersGuessed;
      False otherwise
    '''
    count=0
    for letter in secretWord:
        if letter in lettersGuessed:
            count=count+1
    if count==len(secretWord):
        return True
    else:
        return False


def getGuessedWord(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters and underscores that represents
      what letters in secretWord have been guessed so far.
    '''
    new=[]
    for letter in secretWord:
        if letter in lettersGuessed:
            new.append(letter)
        else:
            new.append("_ ")
    s="".join(new)
    return s



def getAvailableLetters(lettersGuessed):
    '''
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters that represents what letters have not
      yet been guessed.
    '''
    import string
    rem=string.ascii_lowercase
    for letter in rem:
        if letter in lettersGuessed:
            rem=rem.replace(letter,"")
    return rem

    

def hangman(secretWord):

    print('Welcome to the game, Hangman!')
    print("I am thinking of a word that is", len(secretWord), "letters long")
    print("_"*13)
    #lettersGuessed
    #mistakesMade
    #availableLetters
    mistakesMade=0
    lettersGuessed=[]
    guessleft=8
    while mistakesMade<8:
        print ("You have ",guessleft, "guesses left.")
        availableLetters=getAvailableLetters(lettersGuessed)
        print ("Available letters: ",availableLetters)
        guess=input("Please guess a letter: ")
        gslow=guess.lower()
        if gslow in lettersGuessed:
            print ("Oops! You've already guessed that letter: ",getGuessedWord(secretWord,lettersGuessed))
            print("_"*13)
            continue
        else:
            lettersGuessed.append(gslow)
        
        if gslow in secretWord:
            print ("Good guess: ",getGuessedWord(secretWord,lettersGuessed))
            print("_"*13)
        else:
            print ("Oops! That letter is not in my word: ",getGuessedWord(secretWord,lettersGuessed))
            mistakesMade+=1
            guessleft-=1
            print("_"*13)
            
        if isWordGuessed(secretWord,lettersGuessed):
            print("Congratulations! You won!")
            break
    
    if (mistakesMade==8):
        print ("Sorry, you ran out of guesses. The word was ",secretWord)

            
            
        
secretWord ="sea"
hangman(secretWord)
    





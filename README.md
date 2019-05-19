# README

# minesweeper
API test

We ask that you complete the following challenge to evaluate your development skills. Please use the programming language and framework discussed during your interview to accomplish the following task.

## The Game
Develop the classic game of [Minesweeper](https://en.wikipedia.org/wiki/Minesweeper_(video_game))

## Show your work

1.  Create a Public repository - DONE
2.  Commit each step of your process so we can follow your thought process. - DONE

## What to build
The following is a list of items (prioritized from most important to least important) we wish to see:
* Design and implement  a documented RESTful API for the game (think of a mobile app for your API) - DONE
* Implement an API client library for the API designed above. Ideally, in a different language, of your preference, to the one used for the API
* When a cell with no adjacent mines is revealed, all adjacent squares will be revealed (and repeat)
* Ability to 'flag' a cell with a question mark or red flag - DONE
* Detect when game is over - DONE
* Persistence
* Time tracking
* Ability to start a new game and preserve/resume the old ones
* Ability to select the game parameters: number of rows, columns, and mines
* Ability to support multiple users/accounts
 
## Deliverables we expect:
* URL where the game can be accessed and played (use any platform of your preference: heroku.com, aws.amazon.com, etc)
* Code in a public Github repo - DONE
* README file with the decisions taken and important notes - DONE


## Methods

The following methods were implemented:
- `create(x_size, y_size, qtd_mines)` Create a new game. With the number of rows 'x', number of columns 'y' and the quantity of mines 'qtd_mines'
- `play(x, y)` Performs the action of selecting a field of the X and Y coordinate 
- `flag(x, y, type)`Places a flag in the coordinate X and Y. It can be of type 'red_flag' or 'question_mark'
- `status()` This is an output that returns a current representation of the board.

## Usage

```
x_size, y_size, qtd_mines = 10, 10, 5
game = MinesweeperClass.new(x_size, y_size, qtd_mines)
play(1,2)
play(2,3)
flag(1,1, 'red_flag')
flag(1,4, 'question_mark')
```
## API

The following methods were implemented:
- `post /api/v1/games/create` Create a new game. Params: 'x_size' - integer, 'y_size' - integer and 'qtd_mines'
- `post /api/v1/games/play` Performs the action of selecting a field of the X and Y coordinate. Params: 'x' - integer, 'y' - integer
- `post /api/v1/games/flag` Places a flag in the coordinate X and Y. It can be of type 'red_flag' or 'question_mark'. Params: 'x' - integer, 'y' - integer, 'type' - string ['red_flag', 'question_mark']
- `get /api/v1/games/status` This is an output that returns a current representation of the board.

## Executable Code

The executable code can be accessed at: https://rocky-falls-86186.herokuapp.com/

# TicTacToe

[![Code Climate](https://codeclimate.com/github/schnauzer/tic-tac-toe.png)](https://codeclimate.com/github/schnauzer/tic-tac-toe)

`TicTacToe` includes an API for TicTacToe grids and moves, a competent AI, and a means of letting humans
play from the command line.

## Installation

 * Clone the Github repo.
 * Run `bundle install`
 * Ensure that tests are running. (`rspec`.)
 * Run `ruby foo.rb` to tinker with various aspects of the library.

## Quick Code Tour

Playing a game:

```ruby
# require and include the library
# ...

game = Game.new RandomPlayer.new :x, SmartPlayer.new :o
game.play!
```

All possible players:

 * `RandomPlayer` - Picks a move randomly.
 * `HumanPlayer` - Asks a human through the console for moves.
 * `SmartPlayer` - Intelligently picks a move.

## Hacking

 * See the [`TODO.txt`](TODO.txt) file for a list of things that need to happen.
 * Hack away!
 * Ensure that we have good test coverage. (That's what `simplecov` is for.)
 * Submit a pull request.

## License

```
Copyright (c) 2013 Ethan Ransom

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

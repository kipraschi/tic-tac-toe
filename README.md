# Tic Tac Toe

Command-line Tic Tac Toe built in Ruby. Part of The Odin Project Ruby curriculum.

## How to run

    ruby main.rb

## Structure

- `main.rb` - entry point
- `lib/game.rb` - game loop, turn management, win/tie resolution
- `lib/board.rb` - board state and win detection across rows, columns and diagonals
- `lib/player.rb` - player input with validation

## Running tests

    bundle install
    bundle exec rspec
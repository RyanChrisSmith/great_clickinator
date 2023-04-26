# The Great Clickinator

<u>

## Dependencies
</u>

 - This project used the ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) `VERSION 3.1.2` and was developed/tested on ![Mac](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=apple&logoColor=white) `VENTURA 13.2.1`
 - Go ahead, be curious and click on the links for the many [pull requests](https://github.com/RyanChrisSmith/great_clickinator/pulls?q=is%3Apr+is%3Aclosed) with a *PR template* and an extensive [commit history](https://github.com/RyanChrisSmith/great_clickinator/commits/main) to keep track of all changes


<u>

## Install
</u>

- Please note, any time `$` is in the command line prompt, that is to signify the beginning of a terminal command, do not include the `$` in the input
- To install the necessary software to run a ruby program, please follow the sub points below:
  - To install a version manager such as `rbenv` to easily switch between `Ruby` versions [rbenv tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos)
  - Once a version manager is installed, install ruby using `$ rbenv install 3.1.2`
  - To install a bundler for the gems already in the file, run that by inputting `$ gem install bundler`

  _Now you are ready to move forward with this repo!_

  - Clone this Git repository to your local machine [here](https://github.com/RyanChrisSmith/great_clickinator)
  - Run `$ cd great_clickinator` into the repo
  - Run `$ bundle install` once in the correct folder to add all the gems

<u>

## Testing
</u>

  - Run `$ rspec` or `$ rspec spec` to run the whole test suite at once
    - There will be 27 passing tests and 0 failures
  - If you would like to run any of the specific files just follow the file structure
    - for example if I want to run just the tests for the file reader it would be `$ rspec spec/file_reader_spec.rb`

<u>

## Running the Program
</u>

- This program was created to dynamically take in any year you would like to input
- If the year does not exist in the data set, the counts will return as 0
- Run `$ ruby runner.rb` and after the `.rb` in the command input the year you would like to see results for
  - for example `$ ruby runner.rb 2021` will return the results:
  ```
  [{"https://youtube.com/"=>557}, {"https://twitter.com/"=>512}, {"https://reddit.com/"=>510}, {"https://github.com/"=>497}, {"https://linkedin.com/"=>496}, {"https://google.com/"=>492}]
  ```
- Note that the results are sorted in descending click count order




<u>

## Design Decisions
</u>
# The Great Clickinator

<u>

## Dependencies
</u>

 - This project used the ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) `VERSION 3.1.2` and was developed/tested on ![Mac](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=apple&logoColor=white) `VENTURA 13.2.1`
 - Go ahead, be curious and click on the links for the many [pull requests](https://github.com/RyanChrisSmith/great_clickinator/pulls?q=is%3Apr+is%3Aclosed) with a *PR template* and an extensive [commit history](https://github.com/RyanChrisSmith/great_clickinator/commits/main) to keep track of all changes

  - GEMS
    - [Pry](https://github.com/pry/pry) - provides a more powerful and interactive REPL (Read-Eval-Print Loop) console for debugging and exploring Ruby code.

    - [Rubocop](https://github.com/rubocop/rubocop) - provides a static code analyzer to enforce consistent coding style, best practices, and detect potential issues in a Ruby codebase.

    - [RSpec](https://github.com/rspec) - framework for writing and executing tests to ensure the expected behavior of a Ruby codebase.

    - [Simplecov](https://github.com/simplecov-ruby/simplecov) - provides code coverage analysis for a Ruby codebase.


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
- Run `$ ruby runner.rb` and after the `.rb` in the command input the `<year>` you would like to see results for
  - for example `$ ruby runner.rb 2021` will return the results:
  ```
  [{"https://youtube.com/"=>557}, {"https://twitter.com/"=>512}, {"https://reddit.com/"=>510}, {"https://github.com/"=>497}, {"https://linkedin.com/"=>496}, {"https://google.com/"=>492}]
  ```



<u>

## Design Decisions
</u>
- The following order of files is to help the explanation loosely follow the data flow

### _File_reader_

  - This class is responsible for reading data from a file. It accepts a file path as a parameter, checks the file extension, and reads the data from the file using the appropriate method (CSV or JSON). The read method returns the parsed data.

  - The design decision to separate the file reading logic into its own class allows for better separation of concerns and improves code modularity. It also allows for easier testing of the file reading logic as it can be mocked or stubbed in tests.

  - If there were ever a situation that another file type needed to be added, it would be simple to add the method here

### _Decodes_file_

  - This class is responsible for parsing the data from a file containing click data and converting it into an array of Click objects. It uses the FileReader class to read the data from the file and then maps each row of data to a new Click object.

  - By creating a separate DecodesFile class, the code achieves a better separation of concerns by ensuring that the class is solely responsible for reading and parsing the decoding file, and for generating the appropriate Click objects. This design also makes the code more modular, as each class is responsible for a specific aspect of the codebase.

  - Moreover, separating the decoding logic into its own class allows for easier testing, as the class can be isolated from the rest of the code and tested independently. It also facilitates easier maintenance of the code, as any changes to the decoding logic can be made in one place, rather than being scattered throughout the codebase.

### _Encodes_file_

  - This class is responsible for parsing the data from a file containing link data and converting it into an array of Link objects. It uses the FileReader class to read the data from the file and then maps each row of data to a new Link object.

  - The design decision to create a separate EncodesFile class provides better separation of concerns and improves code modularity. It also allows for easier testing and easier maintenance of the code.

### _Click_

  - This class represents a single click on a link. It initializes with a hash of data, which is parsed and stored as instance variables. The year attribute is parsed from the timestamp attribute using the DateTime.strptime method.

  - Using a separate Click class follows the OOP principles of encapsulation and single responsibility, which provides a well-organized and object-oriented approach to the code. By creating a single instance of a Click object for each click event, the relevant data is encapsulated into a single entity, making the code simpler and more manageable. Additionally, this design decision promotes easier manipulation and filtering of the click data, which further improves the maintainability of the code.

### _Link_

  - This class represents a single link. It initializes with a hash of data, which is parsed and stored as instance variables. The bitlink attribute is created from the hash attribute and formatted as a bitly link.

  - Creating a distinct Link class, much like the Click class, provides a structured and object-oriented approach to the code by separating the link data into a dedicated entity. The use of a Link object allows for encapsulating all the relevant data related to a link in a single instance, making the code more intuitive and manageable.

### _Click Counter_

  - This class is responsible for counting the number of clicks for each link in a given year. It initializes with file paths for a file containing link data and a file containing click data. It uses the EncodesFile and DecodesFile classes to parse the link and click data, respectively. The count method filters the clicks by year and link and returns a sorted array of objects containing the long_url and corresponding counts.
  - This class is designed to count the number of clicks for each long URL in a given year, based on the data provided in two input files: one that contains information about links and another that contains information about clicks on those links.
  - Some of the more complicated business logic happens within this class so it happens to be the longest. The logic was left in this class, rather than abstracted out, as there is really only one major method within. If there were a larger variety of ways to count the clicks (i.e. by_website, by_day, etc) it would make sense to start to make more methods and then most likely abstract out to a factory style refactor having a class that selects the class and within that class has the count/sort method necessary

<u>

## Extensions
</u>

- Additional `count` methods by different parameters than year (website, day, time, etc)
- Different file input types (yaml, xml, etc.)
- Writing a CSV for output to have a record
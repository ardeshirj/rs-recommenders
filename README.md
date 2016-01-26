# RS-Recommenders

Run the bundle to install the gems from `Gemfile`:
```shell
bundle install
```

Load the ".csv" files to sqlite3 database run the following command
from the parent directory
```shell
sqlite3 rs-db < create-db.sql
```

To run the `main.rb` from src file
```shell
ruby src/main.rb use_id strategy
# where user_id and strategy are program arguments
```

To run the tests and checkout the test coverage
```shell
rspec spec/
```
There should be a `coverage` directory with `index.html`

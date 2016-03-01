# RS-Recommenders
Interview project from Retention Science. The raw data has been provided by Retention Science.

## Setup
Run the bundle to install the gems from `Gemfile`:
```shell
bundle install
```

Load the ".csv" files to sqlite3 database run the following command
from the parent directory
```shell
sqlite3 rs-db < create-db.sql
```

## Run
Run main file
```shell
ruby src/main.rb use_id strategy
# where user_id and strategy are program arguments
```

Run spec files
```shell
rspec spec/
# checkout the report at `coverage/index.html`
```

# crystal-nopaste

nopaste implemented in Crystal

## Settings

### DB settings

```
cp db-config.json.sample db-config.json
```

#### sqlite3 settings

|key|detail|
|---|---|
|db|DataBase type(sqlite3)|
|url|DataBase file path|

## Installation

### Create DB

```
crystal src/db/db_migration.cr
```

## Usage

```
crystal build --release src/crystal-nopaste.cr
./src/crystal-nopaste.cr
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/kozakana/crystal-nopaste/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [kozakana](https://github.com/kozakana) kozakana - creator, maintainer

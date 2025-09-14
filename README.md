# README

A simple command-line application for searching names of clients from `appassets02.shiftcare.com/manual/clients.json` and finding duplicates.

Setup:
- Clone the repository
  ```
  git clone https://github.com/djbelmonte/json-search.git
  ```
- Go inside the project
  ```
  cd json-search
  ```
- Make sure you have ruby installed
  ```
  ruby -v
  ```

For usage, there are two supported commands at the moment
1. Search for a client using a `query_string`
   ```
   bin/rails json_search:search[<query_string>]
   ```
   e.g.
   ```
   bin/rails json_search:search["john"]
   ```
2. Find duplicates
   ```
   bin/rails json_search:duplicates
   ```

Limitations
- This only supports the dataset from `appassets02.shiftcare.com/manual/clients.json`
- Can only search for the "full_name" field at the moment
- Duplicate checking is for email only
- No other argument can be passed at the moment for search command aside from the query_string

 Program name: Museum Tracker App

Description: This app allows a Museum manager to add a museum to a list. From the list the user can select a museum and update, delete or add artwork to that museum. Also from the specific museum page the user can delete artwork.

Ruby Setup Gems used: Sinatra, Sinatra-contrib, rspec, capybara, pry ,psql and pg. Bundler must be installed.

Instruction to create the database:
username=# CREATE DATABASE museum_tracker;
username=# \c museum_tracker;
museum_tracker=# CREATE TABLE museums (id serial PRIMARY KEY, name varchar);
museum_tracker=# CREATE TABLE artworks (id serial PRIMARY KEY, description varchar, museum_id int);
museum_tracker=# CREATE DATABASE train_system_test WITH TEMPLATE museum_tracker;

Copying/license: The MIT License (MIT)

Copyright (c)  2015 John Young

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

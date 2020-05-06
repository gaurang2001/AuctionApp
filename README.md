## Versions 

Ruby 3.0.1
Rails 5.2.4.1

## Project Setup
 1. Clone the repository using git
```
git clone https://github.com/gaurang2001/IRIS_191IT113_RoR_CI105
```
or download the zip file from the repository

2. Install gems
```
bundle install
```

3. Create database
```
rake db:create
```
4. Migrate the migrations to the database
```
rake db:migrate
```
5. Run the server
```
rails server
```

## List of implemented features
* Every user can see other users products
* A user can bid for other users' products
* Once bid, it updates users' name in owners My Products page
* Once claimed, the product gets added to the list of products of the user who bought it
* Products put on auction and products claimed are shown in My Products page
* Each product has necessary contact details so that the buyer can contact the seller
* Each product has the following parameters - Product Name, Image, Description, Deadline, Starting bid, Price

## List of planned features
* Better UI
* A live clock to show time remaining until deadline

## List of known bugs
* If no products exist, container border is still shown

## References used
* Stack overflow
* Ruby Guides

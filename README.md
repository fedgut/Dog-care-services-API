<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
![Hireable](https://cdn.rawgit.com/hiendv/hireable/master/styles/default/yes.svg)

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/fedgut/dog_sitter_API">
    <img src="https://raw.githubusercontent.com/euqueme/toy-app/master/app/assets/images/mLogo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Dog Sitter Services API Final Capstone project</h3>

  <p align="center">
    This project is part of the Microverse curriculum!
    <br />
    <a href="https://github.com/fedgut/dog_sitter_API"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/fedgut/dog_sitter_API/issues">Report Bug</a>
    ·
    <a href="https://github.com/fedgut/dog_sitter_API/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Documentation](#documentation)
  * [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Setup](#setup)
  * [Usage](#usage)
  * [Run Test](#run-test)
  * [Deployment](#deployment)
  * [Built With](#built-with)
* [Authors](#authors)
* [Contributing](#contributing)
* [Show your support](#show-support)
* [Acknowledgements](#acknowledgements)
* [License](#license)

<!-- ABOUT THE PROJECT -->
## About The Project

[![asciicast][product-screenshot]](https://www.loom.com/share/1fa671b5e0584f3f82b0c27e9640cc54)

This API matches dog care services (Dog sitting, walking, grooming, etc.) with different users!
Many sellers can offer the same service, but who do you trust to care for your furry friend? 
Add those services you prefer to your favorites and easily keep track of them.


This is the final Capstone project of the Microverse Curriculum.

### Documentation

The [documentation]() was built using raddocs 

### Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Install RVM

### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
rails db:migrate
```

### Usage

Start server with:

```
rails server
```

Install [httpie](https://httpie.org/) 

#### Signup

The following command will create an login a new user in the database, fill in your name, email and password

```bash
$ http :3000/v1/signup name=Eduardo email=eduardo@email.com password=foobar password_confirmation=foobar
```
#### Login

Users Log in with their email and password

```bash
$ http :3000/v1/login email=eduardo@email.com password=foobar
```

#### Register a service

Only Admins can register a service! We do this to guarantee all dog handlers have insurance and are properly identified. 

To add services locally open a rails console and update the user you want to set as admin this way:

```bash
$ rails c
> User.find_by(email: 'eduardo@email.com').update(admin: true)
> exit
```
After that login the user and keep the auth_token safe!

```bash
$ http :3000/login email=eduardo@email.com password=foobar
```

Finally we'll create a new service this way (paste the auth_token in the Authorization header)

```bash
$ http :3000/services name=grooming user_id=1 \
Authorization:'paste your auth token here'
```

#### Services index

To see all the services available 

```bash
$ http :3000/services
```

#### To see the details of a Service

Once you have seen the list of all services, choose and and type in the id in place of the *:id* too see its details.

```bash
$ http :3000/service/:id
```
#### Create Favorite 

To create a favorite login the user (admin or not) and keep the auth_token safe
```bash
$ http :3000/login email=youremail@email.com password=foobar
```
Now we'll enter the service_id and the Authentication header

```bash
$ http :3000/users/2/favorites service_id=1 \
Authorization:'yourtoken'
```
#### All Favorites

To see all your favorites you must log in, we'll use the same authentication steps as before

```bash
$ http :3000/users/2/favourites Authorization:'yourtoken'
```

### Run tests

to run the test:

```
rspec
```

### Built With
This project was built using these technologies.
* Ruby 
* Rails 
* Rspec
* raddocs
* Rubocop
* VsCode

<!-- CONTACT -->
## Authors

[Eduardo Gutierrez](https://github.com/fedgut) - fedgut@gmail.com

Project [Link](https://github.com/fedgut/dog_sitter_API/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [The Best readme Template](https://github.com/othneildrew/Best-README-Template)

<!-- LICENSE -->
## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

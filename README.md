# Lee Western's Blog

## Summary

This is a personal website of Lê Phương Tây(Lee Western)

See [leewestern.com](https://www.leewestern.com/)

## Tech Stack

This is a fullstack Rails application

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)

![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)

## Installation

### Tools

- rvm
- ruby >= 3.1
- node >= 18
- yarn
- posgresql >= 14.0

### Clone

```bash
  git clone https://github.com/lpwanw/rails-threads.git
```

### Prepration

```bash
  rails db:prepare
```

## Run project

To run this project

```bash
  bin/dev
```

### Test

Rspec

```bash
  rspec
  # for only models
  rspec spec/models/
```

### cucumber

```bash
  # will update soon
```

## Features

- use TailwindCss for style

### On the porfolio

- React for really rich UI

### On the blogs

- Hotwrite driven the UI
    * turbo-frame for modal
    * Inline edit comment
    * broad-cast for notification
- Authentication with devise & devise-async for background email
- Post with ActionText for trix editor
- Notification use broadcast with ActionCable for realtime update

## Authors

- [@lpwanw](https://www.github.com/lpwanw)

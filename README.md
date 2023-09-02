# Simple Store

[![Tests](https://github.com/wbotelhos/simple_store/workflows/Tests/badge.svg)](https://github.com/wbotelhos/simple_store/actions)
[![Maintainability](https://api.codeclimate.com/v1/badges/45977db54fe009e15080/maintainability)](https://codeclimate.com/github/wbotelhos/simple_store/maintainability)
[![Coverage](https://codecov.io/gh/wbotelhos/simple_store/graph/badge.svg?token=WPhiD1lfbO)](https://codecov.io/gh/wbotelhos/simple_store)

It's a simple store receiving a list of products and the desired quantity along with some product's characteristics then the code responds with the line items containing the price for each product, the taxes and the total.

## Setup

Using Docker:

```sh
docker build . -t simple_store
```

Using your local machine:

```rb
git clone https://github.com/wbotelhos/simple_store
cd simple_store
bundle install
```

## How to Run?

Or using Docker:

```sh
docker run -i simple_store ruby run.rb < data/input.txt
```

Using your local machine:

```sh
ruby run.rb < data/input.txt
```

## Tests

The main test with the example cases from the [TODO](https://github.com/wbotelhos/simple_store/blob/main/TODO.md) file
is [this one](https://github.com/wbotelhos/simple_store/blob/main/spec/calculator_spec.rb).

Using Docker:

```sh
docker run simple_store bundle exec rspec
```

Using your local machine:

```rb
rspec
```

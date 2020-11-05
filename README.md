
<h1  align="center">Tweet Weather API</h1>

<p>

<a  href="#"  target="_blank">

<img  alt="License: MIT"  src="https://img.shields.io/badge/License-MIT-yellow.svg"  />

</a>

<a  href="https://twitter.com/souzagab"  target="_blank">

<img  alt="Twitter: souzagab"  src="https://img.shields.io/twitter/follow/souzagab.svg?style=social"  />

</a>

</p>



> An api that tweets about the weather

This is an Rails 6 Api-only, that uses the [twitter](https://github.com/sferik/twitter) and the [Ropenweather](https://github.com/souzagab/ropenweather) gems to create a tweet.


## Install

To use this api you will need to clone the repo and run it locally:

    git clone

Enter the project folder and

    cd tweet-weather-api
This api uses [twitter api](https://developer.twitter.com/)  and you will need to register, get your keys and set it in the `.env` file, rename the `.env.sample` file and set the variables:

    mv .env.sample  .env

Edit it and the keys:

    OPEN_WEATHER_KEY
    TWITTER_CONSUMER_KEY
    TWITTER_CONSUMER_SECRET
    TWITTER_ACESS_TOKEN
    TWITTER_TOKEN_SECRET



Install dependencies:

    bundle install

Run the server:

    rails s

### Run tests

```sh
rspec
```
## How to use

### Available Routes
| HTTP Method | Path | Description | Params | HTTP Responses |
| --- | --- | --- | --- | --- |
| POST | `/tweets` | Create an tweet with a city param. | **api_key** **city** | 201, 401, 404 |
#### Params
**api_key**: `String` , Your api key from [OpenWeatherMap](https://openweathermap.org/api)
**city**: `String`,   Name of the chosen city for weather forecast
#### Example:
```sh
curl --request POST \
  --url http://localhost:3000/tweet \
  --header 'Content-Type: application/json' \
  --data '{
	"api_key":"2037f6r73e12e3a6857ee0v7sdmvg38a6206b3",
	"city":"London"
}'
```
#### HTTP Responses
 **201**  Created


> Creates a tweet and returns url

 ```json
{
  "url": "https://twitter.com/YourUser/status/135437132800"
}
```
##### Errors:
**401** Unauthorized

> Invalid api_key from OpenWeather

```json
{
  "api_key": "Invalid Api-key. Check http://openweathermap.org/faq#error401 for more info."
}
```
**404** Not Found

> Invalid City
```json
{
  "city": "City not found"
}
```
## Author



👤 **Gabriel S.**



* Twitter: [@souzagab](https://twitter.com/souzagab)

* Github: [@souzagab](https://github.com/souzagab)

* LinkedIn: [@souzagab](https://linkedin.com/in/souzagab)



## Show your support



Give a ⭐️ if this project helped you!



***

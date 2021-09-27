# Shiny Server Example

Example project showing how to run multiple Shiny applications using Shiny Server on Heroku.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Usage

### Build

Run the following command to build the docker image.

```
docker build --tag shiny_server_example .
```

### Run

Run the following command to run the docker image.

```
docker run -p "8080:8080" shiny_server_example
```

Open your web browser to http://localhost:8080.

## Deploy to Heroku

Run the following commands to create the Heroku application and deploy the code.

Create a container stack application.

```
heroku create --stack=container
```

Deploy the code.

```
git push heroku main
```

View the application in your web browser

```
heroku open
```


## License

MIT License. Copyright (c) 2021 Chris Stefano. See [LICENSE](LICENSE) for details.

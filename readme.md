# CouchDB with Let's encrypt's SSL certificate for Self-hosted LiveSync.

## Requirements 

- Internet-accessible webserver
- Docker and docker-compose
- Valid domain

## Limitations

- Verbose logging (Just leave it to docker now)
- Automatic detection of malicious access.

## How to Use

1. Clone the repository, `git clone git@github.com:vrtmrz/self-hosted-livesync-server.git`
2. Create Caddy's network: `docker network create caddy`
3. Configure files  
    1. `caddy.handle_path_1: /e=_/*` on `docker-compose.yml`  
You have to change this `e=_` to something your favorite secret word.
    2. `authentication_redirect = /e=_/_utils/session.html` on `conf/local.ini`  
change `e=_` too, as same as you changed on 2.1..
4. Set environment variables.   

| name           | value                               | example        |
| -------------- | ----------------------------------- | -------------- |
| COUCHDB_SERVER | Your server's domain                | db.example.net |
| COUCHDB_USER   | The account name you want to access | testuser       |
| COUCHDB_PW     | The password                        | testpassword   |



5. Run `docker-compose -f docker-compose.yml up`  
Note: If you using an arm machine, `docker-compose -f docker-compose.yml -f docker-compose.arm.yml up`
1. Check from the browser, open `https://COUCHDB_SERVER/e=_/_utils`, and try to authenticate.
2. Check from Self-hosted LiveSync, as like below

| name          | value                      | example                    |
| ------------- | -------------------------- | -------------------------- |
| URI           | https://COUCHDB_SERVER/e=_ | https://db.example.net/e=_ |
| Username      | COUCHDB_USER               | testuser                   |
| Password      | COUCHDB_PW                 | testpassword               |
| Database name | As you like                | test                       |

8. If you could access and use the database, `docker-compose -f docker-compose.yml start` to enable your server.
Note: or `docker-compose -f docker-compose.yml -f docker-compose.arm.yml start`.

## License 
MIT
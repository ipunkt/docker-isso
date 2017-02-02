# docker-isso
isso with environment based configuration

# Environment variables

| Variable | Default | Explanation | Isso name |
| ------------- | ------------- | ------------- | ------------- |
| URL | - | Url to the website which will host the comments. Used for CORS Headers in Isso | host |
| LISTEN | http://0.0.0.0:8080/ | Address and port where isso should listen for connections | listen |
| DB | /db/comments.db | Path where the sqlite database should be located | db\_path |


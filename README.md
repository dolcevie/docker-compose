# docker-compose-laravel

docker-compose up --build

export APP_NAME=ap_sigap
docker-compose run --rm composer install --ignore-platform-reqs

docker-compose run --rm artisan key:generate

docker exec -it 07ac08a874c9 ssh -i /home/.ssh/hugo.vazquez.pem -v hugo.vazquez@10.54.24.10 -L 33060:sridesbds09.c1v8vajd21xm.us-east-1.rds.amazonaws.com:3306 -N

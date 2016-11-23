if [ -z $PUBLICHTML ]; then
  echo "Usage: PUBLICHTML=path/to/public/html ./run.sh"
  echo "You may also specify a port using PORT=port PUBLICHTML=.. ./run.sh"
  exit 1
fi

if [ -z $PORT ]; then
  PORT=80
fi

echo "Starting nginx-php-arm64 container using port $PORT"

docker run -d -p 8180:80 -v $PUBLICHTML:/usr/share/nginx/html jpnh/nginx-php-arm64


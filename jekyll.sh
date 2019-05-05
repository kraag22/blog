#/bin/sh

JEKYLL_VERSION=3.8
DIR=$(pwd)
echo "Running jekyll in $DIR"
docker run --rm -p 4000:4000 \
  --volume="$DIR:/srv/jekyll" \
  -it jekyll/builder:$JEKYLL_VERSION \
  jekyll "$@"

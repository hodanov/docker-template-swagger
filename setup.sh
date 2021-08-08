#!bash

touch specification.yml
docker container run -d --name tmp-swagger-ui -e SWAGGER_JSON=/specification.yml -v $(pwd)/specification.yml:/specification.yml swaggerapi/swagger-ui
docker container cp tmp-swagger-ui:/usr/share/nginx/html ./dist
docker container rm -f tmp-swagger-ui
rm ./dist/specification.yml
mv specification.yml ./dist/

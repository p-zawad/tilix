# tilix
Dockerfile for Tilix container

Simple ubuntu based Docker image. It has installed git, wget, mc and tilix terminal so it is a good starting point for further experimentation. 

You can run it with
'docker run --rm -ti --name "tilix" --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -v "$(pwd)/persistent_storage":/home/student/persistent -v /var/run/dbus:/var/run/dbus pzawad/tilix dbus-run-session tilix --session=persistent/tilix.json'

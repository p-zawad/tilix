# tilix
Dockerfile for Tilix container

Simple Ubuntu based Docker image. It has installed `git`, `wget`, `mc` and `tilix` terminal so it is a good starting point for further experimentation. `Tilix` is a very versatile terminal, so read its [documention](https://gnunn1.github.io/tilix-web/manual/) for a high level of comfort. 

You can run it with the GUI using
```
docker run --rm -ti --name "tilix" --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -v "$(pwd)/persistent_storage":/home/student/persistent -v /var/run/dbus:/var/run/dbus pzawad/tilix dbus-run-session tilix --session=persistent/tilix.json
```

Please create `persistent_storage` folder in a present working directory to preserve some data between successive runs of the image. You will be working as a user `student` and your password is `qwerty`. You can use `sudo` to gain administrator (inside container) privileges. The access to persistent storage is via `/home/student/persistent` folder.




# intellij
Projet de construction de l'image docker pour intellij

# lancement de l'image
```editorconfig
sudo docker run -rm -u 1000 \
  -e DISPLAY=${DISPLAY} \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/dev/intellij/idea:/home/developer/.Idea \
  -v ~/dev/intellij/java:/home/developer/.java \
  -v ~/dev/intellij/m2:/home/developer/.m2 \
  -v ~/dev/intellij/config:/home/developer/.config \
  -v ~/dev/intellij/gradle:/home/developer/.gradle \
  -v ~/dev/intellij/share:/home/developer/.local/share/JetBrains \
  -v ~/dev/projets:/home/developer/Project \
  --name idea-$(head -c 4 /dev/urandom | xxd -p)-$(date +'%Y%m%d-%H%M%S') \
mygreffe/intellij:latest
```

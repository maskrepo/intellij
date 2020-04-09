FROM adoptopenjdk/openjdk14

ARG IDEA_VERSION=2020.1
ARG IDEA_BUILD=201.6668.13

RUN  \
  apt-get update && apt-get install --no-install-recommends -y \
  gcc git openssh-client less \
  sudo wget \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 libgtk2.0-0 libxslt1.1 libxxf86vm1 \
  && rm -rf /var/lib/apt/lists/*

ARG idea_source=https://download.jetbrains.com/idea/ideaIC-${IDEA_BUILD}.tar.gz
ARG idea_local_dir=.IdeaIC${IDEA_VERSION}

WORKDIR /opt/idea

RUN curl -fsSL $idea_source -o /opt/idea/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz \
  && rm installer.tgz

RUN useradd -ms /bin/bash developer -p "$(openssl passwd -1 dream)" \
  && adduser developer sudo
USER developer
ENV HOME /home/developer

RUN mkdir /home/developer/.Idea \
  && chown developer /home/developer/.Idea \
  && ln -sf /home/developer/.Idea /home/developer/$idea_local_dir

CMD [ "/opt/idea/bin/idea.sh" ]

#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Development\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "atom"; then

    add_ppa "webupd8team/atom" \
        || print_error "Atom.IO (add PPA)"

    update &> /dev/null \
        || print_error "Atom.IO (resync package index files)" \

fi
install_package "Atom.IO" "atom"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# http://www.dbschema.com/download/DbSchema_linux_7_5_1.deb
if ! package_is_installed "DbSchema"; then
    execute \
        # "wget -q -O /tmp/dbschema.deb http://www.dbschema.com/download/DbSchema_linux_7_5_1.deb \
        #     && sudo dpkg -i /tmp/dbschema.deb \
        #     && sudo apt-get install -f \
        #     && sudo cp /opt/DbSchema/DbSchema.desktop /usr/share/applications/ \
        #     && touch $HOME/.local/share/applications/mimeapps.list \
        #     && sudo echo \"application/xml=DbSchema.desktop\" >> $HOME/.local/share/applications/mimeapps.list \
        #     && rm /tmp/dbschema.deb" \
        "wget -q -O /tmp/dbschema.deb http://www.dbschema.com/download/DbSchema_linux_7_5_1.deb \
            && sudo dpkg -i /tmp/dbschema.deb \
            && sudo apt-get install -f \
            && sudo cp /opt/DbSchema/DbSchema.desktop /usr/share/applications/ \
            && rm /tmp/dbschema.deb" \
        "DbSchema"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# https://docs.docker.com/engine/installation/linux/ubuntulinux/
if ! package_is_installed "docker-engine"; then
    execute \
        "sudo apt-get install apt-transport-https ca-certificates \
            && sudo echo \"deb https://apt.dockerproject.org/repo ubuntu-xenial main\" | sudo tee /etc/apt/sources.list.d/docker.list \
            && sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
            && sudo apt-get update \
            && sudo apt-get install -f" \
        "Docker (add repo)"
fi
install_package "Docker" "docker-engine"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if package_is_installed "docker-engine"; then
    execute \
        "sudo usermod -a -G docker $USER \
            && sudo systemctl enable docker" \
        "Docker (settings)"
fi

if ! package_is_installed "docker-compose"; then
    execute \
        "sudo curl -L \"https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose \
            && sudo chmod +x /usr/local/bin/docker-compose" \
        "Docker Compose"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! cmd_exists "intellij"; then
    execute \
        "wget -q -O /tmp/intellij.tar.gz https://download.jetbrains.com/idea/ideaIU-2017.1.3.tar.gz \
            && sudo mkdir /opt/intellij \
            && sudo tar xf /tmp/intellij.tar.gz -C /opt/intellij --strip-components=1 \
            && sudo ln -s /opt/intellij/bin/idea.sh /usr/sbin/intellij \
            && sudo find /tmp -name \"intellij\" -type d -exec rm -rf '{}' +" \
        "IntelliJ"
    execute \
        "sudo cp ./files/intellij.desktop /usr/share/applications/" \
        "IntelliJ (desktop item)"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# http://www.dbschema.com/download/DbSchema_linux_7_5_1.deb
if ! package_is_installed "javac"; then
    add_ppa "webupd8team/java" \
        || print_error "Oracle Java 8 (add PPA)"
    # "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections \
    #     && sudo apt-get install oracle-java8-installer oracle-java8-set-default \
    #     && sudo update-java-alternatives -s java-8-oracle \
    #     && sudo rm -f /usr/lib/jvm/default-java \
    #     && sudo ln -s /usr/lib/jvm/java-8-oracle/ /usr/lib/jvm/default-java" \
    execute \
        "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections" \
        "Oracle Java 8 (set defaults)"
    # execute \
    #     "sudo apt-get update" \
    #     "Oracle Java 8 (sync pakages)"
    install_package "Oracle Java 8" "oracle-java8-installer"
    execute \
        "sudo update-java-alternatives -s java-8-oracle" \
        "Oracle Java 8 (add to alternates)"
    install_package "Oracle Java 8 (set default)" "oracle-java8-set-default"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ ! -e "/opt/robomongo" ]; then
    execute \
        "sudo find /tmp -name \"robomongo\" -type d -exec rm -rf '{}' + \
          && wget -q -O /tmp/robomongo.tar.gz https://download.robomongo.org/0.9.0/linux/robomongo-0.9.0-linux-x86_64-0786489.tar.gz \
          && mkdir -p /tmp/robomongo \
          && tar -xf /tmp/robomongo.tar.gz -C /tmp/robomongo --strip-components=1 \
          && sudo mv /tmp/robomongo /opt/ \
          && sudo ln -s /opt/robomongo/bin/robomongo /usr/sbin/ \
          && sudo apt-get install -f \
          && sudo find /tmp -name \"robomongo\" -type d -exec rm -rf '{}' +" \
      "Robomongo"

    execute \
      "wget -q -O /tmp/robomongo.png http://mongodb-tools.com/img/robomongo.png \
          && sudo mv /tmp/robomongo.png /opt/robomongo/" \
      "Robomongo (fetch icon)"

    # https://gist.github.com/rob-murray/6828864

    execute \
      "sudo cp ./files/robomongo.desktop /usr/share/applications/" \
      "Robomongo (desktop item)"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "code"; then

    execute \
      "wget -q -O /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868 \
          && sudo dpkg -i /tmp/vscode.deb \
          && sudo apt-get install -f \
          && rm /tmp/vscode.deb" \
      "Visual Studio Code"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "VirtualBox" "virtualbox"
# install_package "VirtualBox Extension Pack" "virtualbox-ext-pack"
install_package "VirtualBox UI" "virtualbox-qt"

if package_is_installed "virtualbox"; then

    execute \
        "sudo usermod -a -G vboxusers $USER" \
        "VirtualBox (group membership)"

fi

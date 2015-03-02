# docker-vagrant

Docker containers tuned to run by Vagrant without a big amount of buzz.

Vagrant knows how to run Docker images but unfortunately it is not pretty
convenient to follow the general line. I like to have `vagrant ssh` but
most containers do not provide it out of box. Moreover, it is a bit tricky
to use it as a lightweight VM. Docker has its own way and I appreciate it.

But I want to have fast VMs because specific of my work is running of 3-5
VirtualBox VMs on my laptop and overall experience is rather horrible. I have
enough RAM but it is still painful sometimes. Some of my work requires
frequent restarts of VMs and this is a case where Docker shines.

So I prepared base images (on Ubuntu, CentOS is coming) I could use to setup
my Vagrant docker environments without a big pain.

## Installation

Basically you may fetch these VMs from Docker Hub:

```shell
$ docker pull nineseconds/docker-vagrant
```

Or if you want, you may build them manually with `Makefile` (just run `make`
and get the same images as I have).

## Usage

Usage is straighforward: please check `Vagrantfile` in the repository. Minimal
`Vagrantfile` is following:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Vagrant uses vagrant user by default. Docker uses root. Use root, it is
  # a development environment anyway.
  config.ssh.username = "root"

  config.vm.provider "docker" do |docker|
      # The name of the image to use
      docker.image = "nineseconds/docker-vagrant"

      # vagrant docker images have SSH so why not to use it
      docker.has_ssh = true

      # Yes, containers are long running.
      docker.remains_running = true
  end
end
```

Let's check how it works...

```shell
$ vagrant up
Bringing machine 'default' up with 'docker' provider...
==> default: Fixed port collision for 22 => 2222. Now on port 2202.
==> default: Creating the container...
    default:   Name: docker-vagrant_default_1425296109
    default:  Image: nineseconds/vagrant-ubuntu
    default: Volume: /home/sergey/dev/pvt/docker-vagrant:/vagrant
    default:   Port: 127.0.0.1:2202:22
    default:
    default: Container created: d15b14122ebcedc8
==> default: Starting container...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 172.17.0.58:22
    default: SSH username: root
    default: SSH auth method: private key
    default:
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default:
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if its present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
$ vagrant ssh
root@d15b14122ebc:~#
```

Works like a charm.

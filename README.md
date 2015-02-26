# Development environment

## Setting up with Vagrant

### Prerequisites

You will need to have the following software installed on your development machine: 
* Virtualbox
* Vagrant
* ruby
* bundler

I suggest you use your native/favourite package manager to install these (for windows see [chocolately](https://chocolatey.org/), Mac OSX: [homebrew](), linux: apt-get :))


### Configuration

Create a config.json file with synced_folders section configured for a folder you wish to develop in. (for an example - see the sample.config.json)

### Setup

Open a terminal or command prompt and change directory to the root directory of your working copy of this repository.

Then run the commands:

```Batchfile
bundle install
vagrant up
vagrant ssh
```

Now you should see your dev directory in the home folder of your vm

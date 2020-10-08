---
description: What you need to do before running or editing the app
---

# Pre-install

In order for the app to run you need to install the package managers that you will use and install alerter for notifications. Below are instructions on how to do that.

### Install Alerter

{% hint style="info" %}
Alerter is a command-line tool to display custom macOS notifications.
{% endhint %}

To install alerter follow the instructions posted in the readme file [**in their repository**](https://github.com/vjeantet/alerter).

### Install Homebrew \(brew\)

{% hint style="info" %}
Homebrew is a package manager for command-line interface packages and applications on macOS. 
{% endhint %}

Enter the below in your Terminal app \(found in the Utilities folder\) to install it.

```text
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### Install Homebrew cask upgrade \(brew cu\)

{% hint style="info" %}
This extension of homebrew allows you to update applications installed using homebrew.
{% endhint %}

Enter the below in your Terminal app after you have installed [**homebrew**](pre-install.md#install-homebrew).

```text
brew tap buo/cask-upgrade
```

### Install git

{% hint style="info" %}
Git is a version control system.
{% endhint %}

Enter the below in your Terminal app after you have installed [**homebrew**](pre-install.md#install-homebrew).

```text
brew install git
```

### Install Node Package Manager \(npm\)

{% hint style="info" %}
Node package manager is the default package manager for JavaScript.
{% endhint %}

NPM is automatically installed when you install the node runtime. First ensure you have already installed [**homebrew**](pre-install.md#install-homebrew-brew). Enter the below in your Terminal app to install node.

```text
brew install node
```

### Install Ruby gems

{% hint style="info" %}
Gems is the package manager for Ruby packages on macOS.
{% endhint %}

Ruby gems is preinstalled on macOS, so you won't have to install it.

### Install Python pip

{% hint style="info" %}
Pip is the package manager for python on macOS.
{% endhint %}

Enter the below in your Terminal app to install pip.

```text
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
```

### Install Mac App Store \(mas\)

{% hint style="info" %}
mas is a command-line interface for the Mac App Store. It allows you to manage application updates from the terminal.
{% endhint %}

Enter the below in your Terminal app after you have installed [**homebrew**](pre-install.md#install-homebrew).

```text
brew install mas
```

### Install Atom Package Manager

{% hint style="info" %}
apm is a package manage to update and manage packages for the Atom code editor.
{% endhint %}

apm is automatically installed when you install the Atom code editor. Enter the below in your Terminal app to install the Atom editor after you have installed [**homebrew**](pre-install.md#install-homebrew).

```text
brew cask install atom
```




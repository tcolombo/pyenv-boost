Pyenv-Boost
===========

A set of little plugins allowing to simplify virtualenv operations :
- creation of a new virtualenv with automatical installation of modules if `requirements.txt` file is present
- automatic creation and update of the `requirements.txt` file
- switch between virtualenvs on the same project
- history of virtualenvs created
- clean of virtualenvs

Installing
----------

Install using `curl`:

```
    curl -L https://raw.githubusercontent.com/tcolombo/pyenv-boost/master/install.sh | bash
```

You can also use the ansible playbook in `ansible/pyenv.yml` wich install Pyenv and Pyenv-boost for user `<login>`:

```
    ansible-playbook -K pyenv.yml -e "user=<login>"
```

A simple example
----------------

1. Start a project and create a virtualenv with Python 3.7.3:

```
    $ pyenv new 3.7.3 myProject
    (myProject) $ 
```

2. During development we install some modules with `pip`:

```
    (myProject) $ pip install numpy
    (myProject) $ pip install flask
```

3. Now we want to test with Python 3.8 for a future evolution of the project :

```
    (myProject) $ pyenv new 3.8-dev
    (myProject-3.8-dev) $ 
```

4. Continuing development, an user report a problem with Python 3.7.1. We test with this version:

```
    (myProject-3.8-dev) $ pyenv new 3.7.1
    (myProject-3.7.1) $ 
```

5. After modification of the code, we go back to Python 3.7.3 in order to verify there is no other problem:

```
    (myProject-3.7.1) $ pyenv new 3.7.3
    (myProject) $
```

6. The project is done. We display the virtualenvs list and make a clean:

```
    (myProject) $ pyenv history
    Virtualenvs history
    Name                           Version
    myProject                      3.7.3
    myProject-3.8-dev              3.8-dev
    myProject-3.7.1                3.7.1

    (myProject) $ pyenv clean

    (myProject) $ pyenv history
    Virtualenvs history
    Name                           Version
    myProject                      3.7.3 
```

7. Now we can distribute our code with the `requirements.txt` file. Other persons using Pyenv-boost can create a virtualenv with all requirements in one command:

```
    $ pyenv new 3.7.3 anotherName
    ...
    Collecting Flask==1.1.1 (from -r requirements.txt (line 2))
    ...
    (anotherName) $
```

License
-------

This program is distributed under GPLv3 license (see [here](LICENSE.md)).

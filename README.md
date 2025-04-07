# 42_Inception
Project developed during the Common Core @ 42 Porto

## Inception

### Summary:
This is a System Administration related exercise

## 🛠️ Usage

### Requirements

The project needs **docker** to run.

### Instructions

**1. Edit and create files**

- Before compiling the project, edit the 'login' argument in the Makefile to match your desired name
- Create a 'secrets' folder inside 'srcs' folder
- In the secrets folder create one '.txt' file for each password needed for each service:
  - db_root_pass.txt
  - wp_db_pass.txt
  - wp_user_pass.txt
  - wp_admin_pass.txt

**2. Compiling the project**

To compile the project, go to its path and run:

```shell
$> make
```

**2. Using it in your browser**

Once it has been compiled and running, open your browser and type:

```
https://<LOGIN>.42.fr

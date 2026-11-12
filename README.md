# INFO
This is the working repository Dillon and I will develop his guitar pedal idea. 

# STRUCTURE
- software: This folder will host the firmware for the stm32 microcontroller that the project will ultimately use
- hardware: This folder will host the hardware related documents, simulations, schematic, pcb layout, schematic symbols, etc. 

# Making and adding ssh-keys to your github
Hey Dillon I'm going to write up some directions on the README file (we will delete them later). 

Definitions: 
- Server: A computer that is running a program, and that program is its only job (usually). For example, a website is hosted ("lives") on a server and its only job is to give you the user the webpage when you ask for it. 
- Repository or repo: This is a location or file that holds the code / files for a project. This project is specifically "version controlled" this just means that the changes that get made in this folder are tracked through time. So you can go back if something goes awry. 

Background:
ssh keys are a way that a server (a computer), in this case github, is able to validate that you are who you say you are. You need to generate the keys and then share your public key to github, you never share your private key. 
You will have to use the Terminal which seems scary at first but the more you use it the less scary it becomes. You wont break anything its okay, I will also explain the commands that you are sending. A `$` will symbolize a terminal command that you should type in, *DO NOT TYPE IN THE $*. The `#` symbol is just a comment on a terminal command you don't need to type that into your command in the terminal. Each command should end in you hitting the `Enter` key 

1. Open up the terminal. On mac you can press Command + Space and then type `Terminal`
2. $ cd ~ # this takes you to your home directory (folder) this is basically where you can see you desktop, documents, picture folder, etc. 
3. $ cd .ssh # this takes you into your .ssh folder, this is where the keys live. if it doesn't exist or you get an error run $ mkdir .ssh
4. $ sshkeygen -t ed25519 -C "your_email@example.com"
5. Don't type anything when it says where do you want to save the key, just hit `Enter`
6. You will be asked for a passphrase, I usually leave it blank and hit `Enter`. If you enter something you will have to enter it everytime you push code to the repo. 
7. Hit `Enter` again or type passphrase again. 
8. $ eval "$(ssh-agent -s)" # this starts a program that just waits until the ssh key is need and will provide it. 
9. $ ssh-add ~/.ssh/id_ed25519 # this command adds your private key to your agent so it knows it exists
10. $ cat ~/.ssh/id_ed25519.pub
11. Copy the output with `ctrl + shift + c` ... weird i know
12. Open github on a browser.
13. click on your profile icon. 
14. click settings. 
15. click SSH and GPG keys on the left 
16. click New SSH key
17. Add a name. maybe like "Dillons Mac"
18. paste your key in the "Key" box. 
19. Click Add SSH key.... Yay, now the repository should like you. 


In this next section we will make a copy of the repository on your local machine (computer).
1. $ cd ~/Documents/ # i'm just gonna put it in your documents folder... cd stands for "change directory" (folder)
2. $ git clone git@github.com:mark-mcnulty/base_phase.git
3. $ cd base_phase # this is the repository
4. you can now go to kicad and open the kicad project it should be located ~/Documents/base_phase/hardware/base_phase/base_phase.kicad_pro 

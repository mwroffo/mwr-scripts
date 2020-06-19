ssh-keygen -t rsa -b 4096 -C mwroffo@gmail.com
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

git config --global user.name "Michael W Roffo"
git config --global user.email mwroffo@gmail.com

git clone git@github.com:mwroffo/mwr-scripts.git
cd mwr-scripts
sudo chmod u+x add-aliases.sh
./add-aliases.sh


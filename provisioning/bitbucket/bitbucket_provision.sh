toilet --gay Install-Bitbucket
sudo wget https://www.atlassian.com/software/stash/downloads/binary/atlassian-bitbucket-4.10.1-x64.bin
sudo chmod a+x atlassian-bitbucket-4.10.1-x64.bin

sudo ./atlassian-bitbucket-4.10.1-x64.bin -q -varfile response.varfile

sudo ln -s /opt/atlassian/bitbucket/4.10.1 /opt/atlassian/bitbucket/current
#sudo /opt/atlassian/bitbucket/current/bin/startup.sh

echo "---------------------------------------------------"
echo "Access Bitbucket at: http://localhost:8084"
echo "---------------------------------------------------"

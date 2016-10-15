toilet --gay Install-Confluence
sudo wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.10.4-x64.bin
sudo chmod a+x atlassian-confluence-5.10.4-x64.bin 
sudo ./atlassian-confluence-5.10.4-x64.bin -q -varfile response.varfile

echo "---------------------------------------------------"
echo "Access Confluence at: http://localhost:8090"
echo "---------------------------------------------------"

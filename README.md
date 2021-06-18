# host-security-demo

Clone this repo, make the demo script executable and run it.

It will download a sample malware file that will trigger a WF detection, install the package freesweep if not installed and replace it with our malicious package (shellcode).

A txt file is generated containing the original app and the malicious md5 hashes

To reset the environment, simply run sudo apt-get remove freesweep and delete the Github project folder

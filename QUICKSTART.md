# Quickstart guide

1. Create an account at Oracle Cloud: https://cloud.oracle.com
2. Create an ssh key
   Open Identity > Domains > Users > API Keys > Add API Key
3. Upload key as Pre-Authenticated Request
   Open Storage > Buckets
   1. Create bucket
   2. Upload ssh pem key
      https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#two
   3. Create Pre-Authenticated Requests
      https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usingpreauthenticatedrequests.htm
   4. Open port via Ingress rule
      Open Networking > Virtual cloud networks > Security list
3. Create a subnet
4. Clone github repository: https://github.com/TheoBrigitte/oci-arm-host-capacity
   1. Fill in environment variable
      ssh fingerprint: ssh-keygen -l -E md5 -f ~/.ssh/id_rsa.pub
5. Run reservation via CircleCI

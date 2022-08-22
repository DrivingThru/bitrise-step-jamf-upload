if [ -z "$jamf_username" ]; then
  echo "Please provide your Jamf Username"
  exit 1
fi

if [ -z "$jamf_password" ]; then
  echo "Please provide your Jamf password"
  exit 1
fi

if [ -z "$upload_path" ]; then
  echo "Please provide the path for the IPA or APK that you wish to upload."
  echo "For IPA it is usually \$BITRISE_IPA_PATH"
  echo "For APK it is usually \$BITRISE_APK_PATH"
  exit 1
fi


set -e
set -x
set -o pipefail

curl -k -u "$jamf_username:$jamf_password" -X POST https://$jamf_server_name.jamfcloud.com/JSSResource/fileuploads/mobiledeviceapplicationsipa/id/$jamf_app_id -F "file=@$upload_path"


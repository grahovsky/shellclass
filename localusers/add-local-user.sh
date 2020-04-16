# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne "0" ]]
then
  echo "Please run with sudo or as root."
  exit 1
fi

# Get the username (login).
read -p "Enter the username to creane: " USER_NAME

# Get the real name (contents for the description field).
read -p "Enter the name of the person who this account is for: " COMMENT

# Get the password.
read -p "Enter the password to use for the account: " PASSWORD

# Create the user with the password.
useradd -c "$COMMENT" -m -- $USER_NAME

# Check to see if the useradd command succeeded.
if [[ $? = 0 ]]
then 
  echo "useradd command succeeded."
else 
  echo "useradd command fail"
  exit 1
fi 

# Set the password.
echo $PASSWORD | passwd --stdin $USER_NAME

# Check to see if the passwd command succeeded.
if [[ $? = 0 ]]
then 
  echo "passwd command succeeded."
else 
  echo "passwd command fail"
  exit 1
fi 

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo -e "\nusername:\n${USER_NAME}\n\npassword:\n${PASSWORD}\n\nhost:\n$(hostname)"

exit 0

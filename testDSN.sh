#!/bin/bash

# Step 1: Connect to ESP32 board and open terminal
echo "Step 1: Connect to ESP32 board and open terminal"
echo "Please connect the ESP32 board and press Enter to continue..."
read

# Step 2: Give permission to access /dev/ttyUSB* (replace * with appropriate number)
echo "Step 2: Granting permission to access /dev/ttyUSB*"
sudo chown rohit /dev/ttyUSB*

# Step 3: Enter screen of the device
echo "Step 3: Entering screen of the device"
screen /dev/ttyUSB1 115200

# Step 4: Perform actions on the device
echo "Step 4: Performing actions on the device"
echo "Please use the DSN id and key from the XML file you have."

# Step 5: Set DSN number
echo "Setting DSN number..."
echo "Enter DSN number from XML file:"
read dsn_number
conf set id/dev_id $dsn_number
echo "Permission granted to use DSN number."

# Step 6: Set private key
echo "Setting private key..."
echo "Enter private key from XML file (without white spaces):"
read -r private_key
private_key=$(echo $private_key | tr -d '[:space:]') # Remove white spaces
conf set id/key $private_key
echo "Permission granted to use private key."

# Step 7: Save and reset device
echo "Saving and resetting device..."
conf save
conf reset
echo "Device will be restarted."

# Step 8: Enter OEM details
echo "Step 8: Enter OEM details"
echo "Opening terminal to enter OEM details..."
echo "Enter the following OEM details:"
echo "1. oem c6327535"
echo "2. oem model Transformer-dev"
echo "3. oem key e3c8432426d726be259ba61812e83c6d"
echo "4. save"
echo "5. reset"

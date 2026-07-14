#!/bin/bash

# Define the file name
file_name="prometheus-rule.yaml"

# Define the old and new values
new_val="registry"

# Replace the value directly inside the file (-i flag means "in-place")
# Use double quotes so Bash can expand the variables properly
sed -i 's/$QUAY_REGISTRY_NAMESPACE'"/$new_val/g" "$file_name"

# Verify the changes
cat "$file_name"  # Output: server_port = 9000
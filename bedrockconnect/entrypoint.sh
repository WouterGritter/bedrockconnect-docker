#!/bin/bash

# Function to convert environment variable to command argument
convert_env_to_arg() {
    local var="$1"
    local arg_name="${var/BC_/}"
    local arg_value="${!var}"
    arg_name="${arg_name,,}"  # Convert to lowercase
    echo "${arg_name}=${arg_value}"
}

# Construct arguments based on environment variables
cmd_args=()

# Iterate through environment variables starting with "BC_"
while IFS='=' read -r name value; do
    if [[ "$name" == BC_* ]]; then
        cmd_args+=("$(convert_env_to_arg "$name")")
    fi
done < <(env)

# Run the Java application with constructed arguments
exec java -jar BedrockConnect-1.0-SNAPSHOT.jar "${cmd_args[@]}"

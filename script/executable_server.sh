#!/usr/bin/env bash

# Navigate to the project directory
cd "$HOME/Project/portofolio/"

# Function to start the server
start_server() {
  livereload
  SERVER_PID=$!
}

# Function to stop the server
stop_server() {
    if [ ! -z "$SERVER_PID" ]; then
        kill "$SERVER_PID"
    fi
}

# Function to reload the server
reload_server() {
    stop_server
    start_server
}

# Handle script termination
trap 'stop_server; exit 0' SIGINT

# Start the server initially
start_server

# Monitor for file changes
while inotifywait -r -e modify,create,delete --exclude '(\.swp|~)$' .; do
    echo "File change detected, reloading server..."
    reload_server
done


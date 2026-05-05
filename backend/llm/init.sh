#!/bin/sh

ollama serve &
OLLAMA_PID=$!

echo "Waiting for Ollama..."
until ollama list > /dev/null 2>&1; do
	sleep 1
done

ollama pull gemma3:1b-it-qat
ollama run gemma3:1b-it-qat ""
wait $OLLAMA_PID

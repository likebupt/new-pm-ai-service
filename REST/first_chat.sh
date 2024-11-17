export AZURE_OPENAI_ENDPOINT="REPLACE_WITH_YOUR_ENDPOINT" #specify environment variable of Azure OpenAI endpoint

export AZURE_OPENAI_API_KEY="REPLACE_WITH_YOUR_KEY"  #specify environment variable of Azure OpenAI key

# text input chat
curl $AZURE_OPENAI_ENDPOINT/openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview   -H "Content-Type: application/json"   -H "api-key: $AZURE_OPENAI_API_KEY"   -d '{"messages":[{"role": "system", "content": "You are a helpful assistant."},{"role": "user", "content": "Does Azure OpenAI support customer managed keys?"},{"role": "assistant", "content": "Yes, customer managed keys are supported by Azure OpenAI."},{"role": "user", "content": "Do other Azure AI services support this too?"}]}'

# input including a public image

curl $AZURE_OPENAI_ENDPOINT/openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview   -H "Content-Type: application/json"   -H "api-key: $AZURE_OPENAI_API_KEY"   -d '{
    "messages": [ 
        {
            "role": "system", 
            "content": "You are a helpful assistant." 
        },
        {
            "role": "user", 
            "content": [
	            {
	                "type": "text",
	                "text": "Describe this picture:"
	            },
	            {
	                "type": "image_url",
	                "image_url": {
                        "url": "https://th.bing.com/th?id=OIP.O21O10UUMdtcI_BsMbZQ_wHaHv&w=244&h=255&c=8&rs=1&qlt=90&o=6&dpr=3&pid=3.1&rm=2"
                    }
                } 
           ] 
        }
    ],
    "max_tokens": 100, 
    "stream": false 
}'


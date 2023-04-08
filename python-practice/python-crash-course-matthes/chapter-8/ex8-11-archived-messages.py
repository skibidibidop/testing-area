# Copy list instead of popping and appending

def send_messages(messages):
    """
    Take list of messages
    Print each message
    Transfer to sent_messages list
    """
    for message in messages:
        print(f"{message}")
    
    sent_messages = messages[:]

    return sent_messages

messages_list = [
    "Hi there!", 
    "How are you?",
    "Don't forget!"
]

sent = send_messages(messages_list)

print(f"Unsent: {messages_list}")
print(f"Sent: {sent}")

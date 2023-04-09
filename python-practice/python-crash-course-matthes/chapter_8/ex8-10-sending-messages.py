# send_messages()
# print each message and move to list sent_messages
# print messages_list and sent_messages to check if
# properly transferred

def send_messages(messages):
    """
    Take list of messages
    Print each message
    Transfer to sent_messages list
    """
    list_length = len(messages)
    sent_messages = []
    counter = 0

    while counter < list_length:
        message = messages.pop(0)
        print(f"{message}")
        sent_messages.append(message)
        counter += 1

    return sent_messages

messages_list = [
    "Hi there!", 
    "How are you?",
    "Don't forget!"
]

sent = send_messages(messages_list)

print(f"Unsent: {messages_list}")
print(f"Sent: {sent}")

# Make list containing series of short text messages
# show_messages(list)
# function should print each text message

def show_messages(messages):
    """
    Take list of messages
    Print each message
    """
    for message in messages:
        print(f"{message}")

messages_list = [
    "Hi there!", 
    "How are you?",
    "Don't forget!"
]

show_messages(messages_list)

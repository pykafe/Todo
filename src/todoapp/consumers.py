from channels import Group

# Connected to websocket.connect
def ws_add(message):
    Group("text").add(message.reply_channel)

# Connected to websocket.receive
def ws_message(message):
    Group("text").send({
        "text": message.content['text'],
    })

# Connected to websocket.disconnect
def ws_disconnect(message):
    Group("text").discard(message.reply_channel)

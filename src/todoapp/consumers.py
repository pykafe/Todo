from channels import Group


# Connected to websocket.connect
def ws_add(message):
    Group("todo").add(message.reply_channel)


# Connected to websocket.receive
def ws_message(message):
    Group("todo").send({
        "text": message.content['text'],
    })


# Connected to websocket.disconnect
def ws_disconnect(message):
    Group("todo").discard(message.reply_channel)

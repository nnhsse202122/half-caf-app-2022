from flask_mail import Message
from app import mail

def send_email(body, subject, sender, recipients):
    msg = Message(subject, sender = sender, recipients = recipients)
    orderBody = "Hi" + recipients + "your order is complete! This is what you will be recieving1" + body
    msg.body = orderBody
    mail.send(msg)
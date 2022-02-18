from flask_mail import Message
from app import mail

def send_email(subject, sender, recipients):
    msg = Message(subject, sender = sender, recipients = recipients)
    msg.body = "Your order is ready!"
    mail.send(msg)